# encoding: utf-8
ActiveAdmin.register Client do
  
  scope :all, :default => true
  scope "Организации", :companys
  scope "Частные", :individuals
  
  filter :contract, :label => "№ договора"
  filter :name, :label => "ФИО"
  filter :building, :label => "Адресу"
  
  index do
    column "Contract N", :contract
    column do |client|
      link_to client.name, admin_client_path(client)
    end
    column "Адрес", :building
  end
  
  show do
    attributes_table :contract, :name
    
    
    active_admin_comments
  end
  

end
