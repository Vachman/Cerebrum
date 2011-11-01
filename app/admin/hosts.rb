ActiveAdmin.register Host do
  menu :label => "Equipment", :priority => 3
  
  index do
      column :hostname
      column :location
      default_actions
  end  
end
