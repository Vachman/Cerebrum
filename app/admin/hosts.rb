# encoding: utf-8
ActiveAdmin.register Host do
  menu :label =>  "Оборудование"  
  
  index do
      column :hostname
      column :location
      default_actions
  end  
end
