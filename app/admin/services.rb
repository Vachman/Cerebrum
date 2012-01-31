# encoding: utf-8
ActiveAdmin.register Service do
  menu :label => "Услуги", :parent => "Подключения"  
  
  scope :all
  scope "Интернет", :internet
  scope "Телефония", :telephony
  scope "Телевидение", :tv
  
  filter :price, :label => "Цена"
  
  index do
    column "Услуга" do  |service| 
      link_to service.name, admin_service_path(service) 
    end
    column "Цена", :price
    column "Категория", :category
  end
  
  show do
    panel "Общие сведения" do
       attributes_table_for service do
          row("Название") { service.name } 
          row("Цена") { service.price }
          row("Категория") { service.category } 
       end
    end
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :category, :label => "Категория",  :as => :select, :collection => [ "Интернет", "Телефония", "Телевидение", "Установка"] 
      f.input :name, :label => "Название" 
      f.input :price, :label => "Стоимость" 
    end
    f.buttons
  end
end
