# encoding: utf-8
ActiveAdmin.register Host do
  menu :label =>  "Оборудование"  
  
  scope :all, :default => true
  scope "На чердаке", :roof  
  scope "В подвале", :basement  
  scope "Доступные", :available
  scope "Недоступные", :unavailable
  
  filter :hostname, :label => "IP"
  filter :mac, :label => "Mac адресу" 
  filter :building, :label => "Дом"
  filter :device_type, :label => "Устройство" 
  
  
  
 
  sidebar "Местонахождение", :only => :show do
    attributes_table_for host do
      row("Дом") { link_to host.building.name, admin_building_path(host.building) unless host.building.nil? } 
      row("Подъезд") { host.porch }
      row("Местонахождение") do 
        unless host.location.nil? || host.location.empty?
          status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
        end
      end
    end
  end

  sidebar "Дополнительно", :only => :show do
	  attributes_table_for host do
			row("Cacti") { link_to "Статистика", "http://moon.obltelecom.ru/graph_view.php?action=preview&host_id=0&graph_template_id=2&filter=#{host.hostname}", :target => "_new" } 
		end
	end
  
  index do
      column "IP" do |host|
					 link_to host.hostname, admin_host_path(host)
			end 
			column "Mac адрес", :mac
      column "Устройство" do |host| 
          host.device_type.nil? ? (div :class => "center" do  '' end ) : host.device_type.model 
      end
      column "Логи", :log_count      
      column "Состояние" do |host| 
        if host.lastms.is_a?(Time) 
          status_tag (host.lastms > Time.now-2.minute ? 'Доступен' : 'Недоступен' ), 
          ( host.lastms > Time.now-2.minute ? :ok : :error ), 
          :title => time_ago_in_words(host.lastms)  
        else
          status_tag "Неизвестно", :title => "Сроду не видели"
        end
      end
      column "Дом", :sortable => false do |host| 
         link_to host.building.name, admin_building_path(host.building) unless host.building.nil? 
      end
      column "Подъезд", :porch
     column "Местонахождение" do |host|
       unless host.location.nil? 
        status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
       end
     end
     #  column  do |host|
	   #			link_to "Телнет", "telnet:#{host.hostname}"
	   #	 end
     # default_actions
  end  

  show do
    puts "Host Show"
    panel "Подробности" do
      attributes_table_for host do
        row("Устройство") { host.device_type.nil? ? '-' : host.device_type.name  }
        row("Sys Location") { host.snmp_location }
        row("Mac Адрес") { host.mac }
        
        row("Версия прошивки") { host.firmware }
        row("Состояние") do  
          if host.lastms.is_a?(Time) 
            status_tag (host.lastms > Time.now-2.minute ? 'Доступен' : 'Недоступен' ), 
            ( host.lastms > Time.now-2.minute ? :ok : :error ), 
            :title => time_ago_in_words(host.lastms)  
          else
            status_tag "Неизвестно", :title => "Сроду не видели"
          end
        end
      end
    end
    panel "Порты" do
      table_for host.ports do |t|
        t.column("Порт") { |port| port.name }
        t.column("Состояние") do |port|      
          status_tag "Up", :ok
          #  status_tag port.status, port.status_tag
        end 
        t.column("Подключен") do |port|      
          # link_to ( port.member ? port.member.name : 'Соеденить' ), edit_admin_port_path(port)
        end
      end  
    end
  end
  
  form do |f|
    f.inputs do
      f.input :mac, :label => "Mac адрес"
      f.input :hostname, :label => "IP"
      f.input :building, :label => "Дом"
      f.input :porch, :as => :select, :selected => f.object.porch.to_i, :collection => (1..20).to_a, :label => "Подъезд" 
      f.input :location, :as => :select, :collection => ["Чердак", "Подвал", "Не определено"], :label => "Местонахождение"     
    end
    
    f.inputs "Uplink" do    
      f.input :uplink_port, :label => "C порта:", :as => :select, :collection => f.object.ports, :remote => true, :input_html => { :onchange => "alert('sasa');"} 
      
      f.semantic_fields_for :uplink do |i|
        i.inputs
      end
    #  f.input :link, :label => "На свич" , :as => :select, :collection => Host.all
    #  f.input :host_port, :label => "К порту" , :as => :select, :collection => []
    end
    
    f.buttons
  end

  action_item :only => [:show] do
     link_to('Телнет',"telnet:#{resource.hostname}")
  end
  
  controller do
    def new
      @resource = Host.new(params[:settings])
    end
  end

end