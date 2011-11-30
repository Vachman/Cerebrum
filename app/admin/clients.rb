# encoding: utf-8
ActiveAdmin.register Client do
  
  scope :all, :default => true
  scope "Организации", :companys
  scope "Частные", :individuals
  
  index do
    column "Contract N", :contract
    column :name
    default_actions
  end
  
  show do
    attributes_table :contract, :name
    
    
    active_admin_comments
  end
  

end
