# encoding: utf-8
ActiveAdmin.register Server do
  menu :label =>  "Серверы", :parent => "Оборудование"
  
  index do
    column "Сервер", :name
    column "Адрес", :hostname 
  end
  
end
