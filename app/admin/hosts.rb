# encoding: utf-8
ActiveAdmin.register Host do
  menu :label =>  "Оборудование"  
  
  scope :all, :default => true
  scope "На крыше", :roof  
  scope "В подвале", :basement  
  
  
  filter :hostname, :label => "IP"
  filter :building, :label => "Дом"  
  
  index do
      column "IP", :hostname 
      column "Дом", :building
      column "Местонахождение", do |host|
        unless host.location.nil? 
          status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning )
        end
      end
      default_actions
  end  
  
  show do
    
  end
  
  form do |f|
    f.inputs do
      f.input :hostname, :label => "IP"
      f.input :building, :label => "Дом"
      f.input :location, :as => :select, :collection => ["Чердак", "Подвал"], :label => "Местонахождение" 
    end
    f.buttons
  end
end
