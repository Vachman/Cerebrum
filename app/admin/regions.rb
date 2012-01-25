# encoding: utf-8
ActiveAdmin.register Region, { :sort_order => "name_asc" } do
  
  
  filter :server, :label => "Сервер" 
  
  index  do
    column "Название", :sortable => :name do |region|
     link_to region.name, admin_region_path(region)
    end
    column("Вланы") do |region| 
      vlans = ""
      region.vlans.each_with_index { |vlan,index|  vlans << ( index.eql?(0) ? '' : ', ' ) << "#{vlan.name}" }
      vlans 
    end
  end
  
  
  form do |f|
    f.inputs "Детали" do
      f.input :name
      f.input :server, :as => :select, :collection => Server.where('role = ?', "Шлюз")
    end     
    f.has_many :vlans do |i|
      i.input :_destroy, :as => :boolean, :label => "delete" unless i.object.id.nil?
      i.input :name, :label => "Тэг"
    end
    f.buttons
  end
  
  
  show do
    panel "Детали" do
      attributes_table_for region do
        row("Название") { region.name }
        row("Шлюз") { region.server }
      end
    end
    panel "Дома" do
      table_for region.buildings do |t|
        t.column("Дом") { |building| building.name }
       end
    end  
    panel "Вланы" do
      table_for region.vlans do |t|
        t.column("Тэг") { |vlan| vlan.name }
      end
    end
  end
end
