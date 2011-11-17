# encoding: utf-8
ActiveAdmin.register Housing do
  menu :label => "Жкх и Дезы", :parent => "Справочник" 
  
  index do
    column :name
    column :phone
    default_actions
  end
  
  show :title => :page_title do
    panel "Подробности" do
      attributes_table_for housing do
        row("Название") { housing.name }
        row("Контакты") { housing.phone }
      end
    end
  end
end
