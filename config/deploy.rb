set :application, "set your application name here"
set :repository,  "set your repository location here"

set :scm, :none
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :bridge, '89.255.93.158:222'
role :nagios, 'nagios.obltelecom.ru:222'                       # Your HTTP server, Apache/etc
set :user, 'v.gevorkyan'
set :password, 'Xr03Ba4z'
set :use_sudo, true 

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :nagios do
  task :default do
    puts "You must type: cap nagios:add -s host= -s location= -s parent_sw="  
  end
  
  desc "Add Host To Nagios"
  task :add, :roles => :nagios do
  end
end

namespace :net do
  task :default do
  end
  
  desc "Scan net for 10.90.90.90"
  task :scan, :roles => :bridge do
    
  end
end