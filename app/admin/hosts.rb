# encoding: utf-8
ActiveAdmin.register Host do
  menu :label =>  "Оборудование"  
  
  scope :all, :default => true
  scope "На чердаке", :roof  
  scope "В подвале", :basement  
  scope "Доступные", :available
  scope "Недоступные", :unavailable
  
  filter :hostname, :label => "IP"
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
  
  index do
      column "IP", :hostname 
      column "Устройство" do |host| 
          host.device_type.nil? ? (div :class => "center" do  '' end ) : host.device_type.model 
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
      column "Дом", :sortable => false do |host| 
         link_to host.building.name, admin_building_path(host.building) unless host.building.nil? 
      end
      column "Подъезд", :porch
     #column "Местонахождение" do |host|
     #  unless host.location.nil? 
     #   status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
     #  end
     #end
      default_actions
  end  
  
  show do
    panel "Подробности" do
      attributes_table_for host do
        row("Hostname") { host.hostname }
        row("Устройство") { host.device_type.nil? ? '-' : host.device_type.name  }
        row("Тестовый") { host.ports_count }
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
  end
  
  form do |f|
    f.inputs do
      f.input :hostname, :label => "IP"
      f.input :building, :label => "Дом"
      f.input :porch, :as => :select, :selected => f.object.porch.to_i, :collection => (1..20).to_a, :label => "Подъезд" 
      f.input :location, :as => :select, :collection => ["Чердак", "Подвал"], :label => "Местонахождение"     
    end
    f.buttons
  end
end
