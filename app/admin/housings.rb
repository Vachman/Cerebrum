# encoding: utf-8
ActiveAdmin.register Housing do
  menu false# :label => "Жкх и Дезы", :parent => "Справочник" 
  
  index do
    column :name
#    column :phone
    default_actions
  end
  
  show :title => :page_title do
    panel "Подробности" do
      attributes_table_for housing do
        row("Название") { housing.name }
#        row("Контакты") { housing.phone }
      end
    end
    panel "Номера телефонов" do
      table_for housing.phones do |t|
        t.column("Описание") { |phone| phone.name }
        t.column("Номер") { |phone| phone.number }
        t.column("Коментарий") { |phone| phone.description }  
      end
    end
    
    panel "Дома" do
      table_for housing.buildings do |t|
        t.column("Адрес") { |building| link_to building.name, admin_building_path(building)  }
      end
    end
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :name
    end     
    f.has_many :phones do |i|
      i.input :_destroy, :as => :boolean, :label => "delete" unless i.object.id.nil?  
      i.input :name, :label => "Описание", :as => :select, :collection => [ "Аварийная", "Диспетчерская", "Ведущий инженер", "Начальник участка", "Электрик"]
      i.input :number, :label => "Номер"
      i.input :description, :label => "Коментарий"
    end
    f.buttons
  end

end
