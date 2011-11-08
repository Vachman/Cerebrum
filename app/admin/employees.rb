ActiveAdmin.register Employee do
  menu :priority => 9999
  
  sidebar :detals, :only => :show do
    attributes_table_for employee do 
      row :name
      row :position
      row :department
    end
  end
  
  sidebar "Phones", :only => :show do
    table_for employee.phones do |t|
      t.column('') { |phone| phone.number }
    end
    link_to "Add phone", new_admin_phone_path( :owner_type => employee.class.name , :owner_id => employee.id )
  end
  
  
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
    attributes_table 
  end
  
  form :title => :page_title do |f| 
    f.inputs "Details" do
      f.input :name 
      f.input :position
      f.input :department
    end
    
    f.has_many :phones, do |n|
      n.input :number
    end
    
    
    f.buttons
  end
    
  controller do
      def define_a_method
        # Instance method
      end
  end
    
end
