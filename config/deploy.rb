$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Для работы rvm
require 'rvm/capistrano' # Для работы rvm
require 'bundler/capistrano' # Для работы bundler.
require "whenever/capistrano"
_cset(:whenever_command)      { "bundle exec whenever" }

set :application, "cerebrum"
set :rails_env, "production"
set :deploy_to, "/srv/#{application}"
set :nginx_path, "/usr/local/nginx"
set :use_sudo, false
set :hostname, "heelpme"
set :rake, 'LOAD_RAILS=1 bundle exec rake'

default_run_options[:pty] = true 
set :repository, "git@github.com:Vachman/Cerebrum.git"  
set :branch, "master"
set :scm, "git"
set :user, "vachman"  # The server's user for deploys
set :scm_passphrase, "xarakiri"  # The deploy user's password

set :rvm_ruby_string, '1.9.3' # Это указание на то, какой Ruby интерпретатор мы будем использовать.
set :rvm_type, :user # Указывает на то, что мы будем использовать rvm, установленный у пользователя, от которого происходит деплой, а не системный rvm.


role :web, "v.gevorkyan@89.255.64.49"                           # Your HTTP server, Apache/etc
role :app, "v.gevorkyan@89.255.64.49"                           # This may be the same as your `Web` server
role :db,  "v.gevorkyan@89.255.64.49", :primary => true         # This is where Rails migrations will run
role :bridge, "v.gevorkyan@89.255.93.158:222", :no_release => true
role :nagios, "v.gevorkyan@nagos.oblelecom.ru", :no_release => true

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

before 'deploy:update', do
  system('git add .')
  system("git commit -am 'Deploy at #{Time.now}'")
  system('git push')  
end

after 'deploy:update_code', :roles => :app do
  run "rm -f #{current_release}/config/database.yml"
  run "ln -s #{deploy_to}/shared/config/database.yml #{current_release}/config/database.yml"
  run "echo 'rvm use 1.9.3' > #{current_release}/.rvmrc"
end

namespace :doon do   
  task :commit do
    system('git add .')
    system("git commit -am 'Deploy at #{Time.now}'")
    system('git push')  
  end
  
  ztask = ARGV[0].split(':')[1] 
  
  if ztask && search_task(ztask.to_sym).nil? && ENV['cmd']
    t = task 'tmp', :roles => [ztask.to_sym], do
      puts capture(ENV['cmd'])
    end
    t.call
    exit
  end
end

# Далее идут правила для перезапуска unicorn. Их стоит просто принять на веру - они работают.
# В случае с Rails 3 приложениями стоит заменять bundle exec unicorn_rails на bundle exec unicorn
namespace :deploy do
  task :restart, :roles => [:web] do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current/ && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start, :roles => [:web] do
    run "cd #{deploy_to}/current/ && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop, :roles => [:web] do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
  task :config_nginx, :roles => :web do
    vhost_template = "
    upstream #{application}.heelp.me_server {
      server unix:/srv/#{application}/shared/unicorn.sock fail_timeout=0;
    }
    server {
        listen #{application}.heelp.me:80;
        client_max_body_size 1G;
        server_name #{application}.heelp.me;
        keepalive_timeout 5;
        root /srv/#{application}/current/public;
        try_files $uri/index.html $uri.html $uri @#{application}.heelp.me;
        location @#{application}.heelp.me {
            proxy_pass http://#{application}.heelp.me_server;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_redirect off;
        }
        error_page 500 502 503 504 /500.html;
        location = /500.html {
          root /srv/#{application}/current/public;
        }
    }"
    
    run "echo '#{vhost_template}' > #{deploy_to}/shared/config/#{application}.#{hostname}.vhost"
    sudo "ln -s #{deploy_to}/shared/config/#{application}.#{hostname}.vhost #{nginx_path}/conf/vhosts/#{application}.#{hostname}.vhost"
  end
end
