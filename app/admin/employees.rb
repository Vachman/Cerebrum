# encoding: utf-8
ActiveAdmin.register Employee do
  
  filter :name, :label => "ФИО" 
  filter :department, :label => "Отдел" 
  
  
  
  sidebar "Детали", :only => :show do
    attributes_table_for employee do 
      row("ФИО") { employee.name }
      row("Должность") { employee.position }
      row("Отдел") { employee.department }
      row("Контакты") { employee.number }
    end
  end
  
#  sidebar "Контакты", :only => :show do
#   table_for employee.phones do |t|
#      t.column('') { |phone| phone.number }
#    end
#    link_to "Добавить", new_admin_phone_path( :owner_type => employee.class.name , :owner_id => employee.id )
#  end
  
  
  index do 
        column "ФИО" do |employee|
          link_to employee.name, admin_employee_path(employee)
        end
        column "Телефон", :number 
        column "Email", :email
        column "Должность", :position 
  end
  
  show :title => :page_title do    
    panel "" do
    end 
  end
  
  form :title => :page_title do |f| 
    f.inputs "Подробнее" do
      f.input :name, :label => "ФИО"  
      f.input :number, :label => "Телефон"
      f.input :email, :label => "Email"  
      f.input :position, :label => "Должность" 
      f.input :department, :label => "Отдел" 
    end   
    f.buttons
  end
    
    
end
