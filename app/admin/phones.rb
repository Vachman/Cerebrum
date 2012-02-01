# encoding: utf-8
ActiveAdmin.register Phone do
  menu false  
  
  form do |f|
    f.inputs "Подробнее" do
      f.input :number, :label => "Телефон"
      f.input :description, :label => "Коментарий"
      f.input :owner_id, :as => :hidden 
      f.input :owner_type, :as => :hidden     
    end       
    f.buttons
  end
  
  controller do
    def new
      @resource = Phone.new(params[:settings])
    end
    
    def create
      @resource = Phone.create(params[:phone])
      redirect_to @resource.owner
      
    end
  end
  
=begin
    TODO return error if phone not saved
=end
end
