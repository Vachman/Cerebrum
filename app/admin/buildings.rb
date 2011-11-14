# encoding: utf-8
ActiveAdmin.register Building do
  menu :label => "Дома"
  
  filter :name, :label => "Дому"

  index do 
    column "Дом", :name
    column "Контакты ЖКХ", do |building|
      building.housing.nil? ? "-" : building.housing.phone
    end
    default_actions  
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Дом"
      f.input :housing, :label => "ЖКХ"
    end
    f.buttons
  end
  
  show :title => :page_title do
    panel "Подробности" do
      attributes_table_for building do
        row("Дом") { building.name }
       ( row("Контакты ЖКХ") { building.housing.phone } ) if not building.housing.nil?
      end
    end
  end  
  
end
