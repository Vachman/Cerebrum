# encoding: utf-8  
ActiveAdmin.register Order do
  menu :label => "Подключения" 
  form do |f|
    f.inputs "Детали" do
      f.input :name
      f.input :contact
      f.input :address
      f.input :due_date
      f.input :status, :as => :select, :collection => ["Новый", "Обработан", "Подключен"]  
    end     
    f.has_many :order_services do |i|
      i.input :_destroy, :as => :boolean, :label => "delete" unless i.object.id.nil?  
      i.input :service, :label => "услуга", :as => :select, :collection => Service.all
    end
    f.buttons
  end
end
