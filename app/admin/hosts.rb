# encoding: utf-8
ActiveAdmin.register Host do
  menu :label =>  "Оборудование"  
  
  scope :all, :default => true
  scope "В чердаке", :roof  
  scope "В подвале", :basement  
  scope "Доступные", :available
  scope "Недоступные", :unavailable
  
  filter :hostname, :label => "IP"
  filter :building, :label => "Дом"  
  filter :porch, :label => "Подъезду" 
  
  
  sidebar "Местонахождение", :only => :show do
    attributes_table_for host do
      row("Дом") { link_to host.building.name, admin_building_path(host.building) unless host.building.nil? } 
      row("Подъезд") { host.porch }
      row("Местонахождение") do 
        unless host.location.nil? 
          status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
        end
      end
    end
  end
  
  index do
      column "IP", :hostname 
      column "Состояние" do |host| 
        if host.lastms.is_a?(Time) 
          status_tag (host.lastms > Time.now-1.minute ? 'Доступен' : 'Недоступен' ), 
          ( host.lastms > Time.now-1.minute ? :ok : :error ), 
          :title => time_ago_in_words(host.lastms)  
        else
          status_tag "Неизвестно", :title => "Сроду не видели"
        end
      end
      column "Дом", :building, :sortable => false 
      column "Подъезд", :porch
      column "Местонахождение" do |host|
        unless host.location.nil? 
          status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
        end
      end
      default_actions
  end  
  
  show do
    panel "Подробности" do
      attributes_table_for host do
        row("Hostname") { host.hostname }
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :hostname, :label => "IP"
      f.input :building, :label => "Дом"
      f.input :porch, :as => :select, :collection => (1..20).to_a, :label => "Подъезд" 
      f.input :location, :as => :select, :collection => ["Чердак", "Подвал"], :label => "Местонахождение"     
    end
    f.buttons
  end
end
