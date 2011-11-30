# encoding: utf-8
ActiveAdmin.register Employee do
  menu :parent => "Справочник", :priority => 2 
  
  filter :name, :label => "ФИО" 
  filter :department, :label => "Отдел" 
  
  
  
  sidebar "Детали", :only => :show do
    attributes_table_for employee do 
      row("ФИО") { employee.name }
      row("Должность") { employee.position }
      row("Отдел") { employee.department }
    end
  end
  
  sidebar "Контакты", :only => :show do
    table_for employee.phones do |t|
      t.column('') { |phone| phone.number }
    end
    link_to "Добавить", new_admin_phone_path( :owner_type => employee.class.name , :owner_id => employee.id )
  end
  
  
  index do 
        column "ФИО", :name
        column("Внутренний") { |employee|
          employee.phones.internal.first.number if not employee.phones.internal.empty?
        }
        column("Телефон") { |employee| 
          employee.phones.first.number if not employee.phones.first.nil? and employee.phones.first.number.length > 4
        }
        column "Должность", :position
    #    column "Отдел", :department, :sortable => false
        default_actions  
  end
  
  show :title => :page_title do    
    panel "" do
    end 
  end
  
  form :title => :page_title do |f| 
    f.inputs "Подробнее" do
      f.input :name, :label => "ФИО"  
      f.input :position, :label => "Должность" 
      f.input :department, :label => "Отдел" 
    end   
    f.buttons
  end
    
    
end
