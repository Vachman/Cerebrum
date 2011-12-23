ActiveAdmin::Dashboards.build do
  
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
     section "Recent Posts" do
       table_for Host.order("log_count Desc").limit(10) do |t|
          t.column("IP Адрес") { |host| link_to host.name, admin_host_path(host)}
          t.column "Устройство" do |host|
            host.device_type.model unless host.device_type.nil? 
          end
          column "Состояние" do |host| 
            if host.lastms.is_a?(Time) 
              status_tag (host.lastms > Time.now-2.minute ? 'Доступен' : 'Недоступен' ), 
              ( host.lastms > Time.now-2.minute ? :ok : :error ), 
              :title => time_ago_in_words(host.lastms)  
            else
              status_tag "Неизвестно", :title => "Сроду не видели"
            end
          end
          t.column("Подъедз") { |host|  host.porch }
          t.column("Местонахождение") do |host| 
            status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning ) unless host.location.nil? or host.location.empty?
       end
         
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
     end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
