# encoding: utf-8
ActiveAdmin.register Building do
  menu :label => "Дома"
  
  filter :name, :label => "Дому"

  index do 
    column :name
    default_actions  
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Дом"
    end
    f.buttons
  end
  
  show do
  end
  
  
end
