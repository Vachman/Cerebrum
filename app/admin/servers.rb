# encoding: utf-8
ActiveAdmin.register Server do
  menu :label =>  "Серверы", :parent => "Оборудование"
  
  filter :name, :label => "Имени"
  filter :hostname
  filter :role, :label => "Роли", :as => :select, :collection => ["Шлюз", "Мониторинг", "Телефония", "DHCP", "Другое"]
  
  
  index do
    column "Сервер" do |server|
      link_to server.name, admin_server_path(server)
    end
    column "Hostname", :hostname
    column "Адрес", :building
    column "Роль", :role 
  end
  
  show do
     panel "Общие сведения" do
         attributes_table_for server do
            row("Название") { server.name }
            row("Hostname") { server.hostname }
            row("Роль") { server.role }
            row("Адрес") { server.building.name unless server.building.nil? }
         end
      end
  end
  
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Название"
      f.input :hostname, :label => "Hostname"
      f.input :building, :label => "Адрес"
      f.input :user, :label => "Пользователь"
      f.input :port , :label => "Порт"
      f.input :role,  :as => :select, :collection => ["Шлюз", "Мониторинг", "Телефония", "DHCP", "Другое"]  
    end
    f.buttons
  end
end
