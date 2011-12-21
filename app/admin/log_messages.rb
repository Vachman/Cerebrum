# encoding: utf-8
ActiveAdmin.register LogMessage do
  menu :label => "Логи", :parent => "Оборудование"  
  
  index do
    column :hostname
    column :message
    column :facility
  end
end
