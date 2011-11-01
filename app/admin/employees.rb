ActiveAdmin.register Employee do
  menu :priority => 9999
  
  index do 
        column :name
        column("Internal") { |employee|
          employee.phones.internal.first.number if not employee.phones.internal.empty?
        }
        column("Phone") { |employee| 
          employee.phones.first.number if not employee.phones.first.nil? and employee.phones.first.number.length > 4
        }
        column :position
        column :department, :sortable => false
        default_actions  
  end
  
  show :title => :page_title do
    attributes_table  do
      row :name 
      row :position
      row :department
      row "Phone numbers" do 
        numbers = ""
        employee.phones.each { |phone| numbers << phone.number << '  ' }
        numbers
      end
    end
  end
  
end
