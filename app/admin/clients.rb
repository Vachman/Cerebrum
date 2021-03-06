# encoding: utf-8
ActiveAdmin.register Client do
  
  scope :all, :default => true
  scope "Организации", :companys
  scope "Частные", :individuals
  
  filter :contract, :label => "№ договора"
  filter :name, :label => "ФИО"
  filter :building, :label => "Адресу"
  
    sidebar "Контакты", :only => :show do
      attributes_table_for client do
        client.phones.each do |phone|
          row("#{ phone.description.empty? ? 'Номер' : phone.description  }") { phone.number }
        end
      end
      link_to "Добавить", new_admin_phone_path( 'settings' => { 'owner_id' => client, 'owner_type' => client.class })
    end
  
  
  
  index do
    column "Contract N", :contract
    column do |client|
      link_to client.name, admin_client_path(client)
    end
    column "Адрес", :building
  end
  
  
  form do |f|
    f.inputs "Детали" do
      f.input :name
      f.input :contract
      f.input :building
    end     
    
    f.has_many :phones do |i|
      i.input :_destroy, :as => :boolean, :label => "delete" unless i.object.id.nil?
      i.input :number, :label => "Номер"
      i.input :description, :label => "Коментарий"
    end
    
    f.has_many :devices do |i|
      i.input :_destroy, :as => :boolean, :label => "delete" unless i.object.id.nil?
      i.input :name, :label => "Название"
      i.input :device_type, :label => "Тип устройства" ,:as => :select, :collection => [ "Ноутбук", "Компьютер", "Роутер", "Свич", "VoIp модем", "ТВ приставка", "Телефон", "Планшет" ]
    end
    f.buttons
  end
  
  show do
    panel "Общие" do
      attributes_table_for client do
        row("Номер договора") { client.contract }
        row("Адрес") { client.building }
      end
    end    
 #   panel "Устройства" do  
  #    client.devices.each do |device|
   #     row(device.device_type) { device.name }
  #    end
  #  end
    
    active_admin_comments  
  end

end
