# encoding: utf-8  
class Service < ActiveRecord::Base  
  belongs_to :service_category
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :price, :message => "can't be blank"
  validates_presence_of :service_category, :message => "can't be blank"
  
  #scope :internet, Service.where('category = ?', 'Интернет')
  #scope :telephony, Service.where('category = ?', 'Телефония')
  #scope :tv, Service.where('category = ?', 'Телевидение')
  scope :in_stock, Service.where('in_stock = ?', '1')
  

  def status_tag
	  case self.in_stock
    when '1' 
      :ok
    when '0'
      :error
    else
      :warn
    end    
	end
	
	def status_name
	  case self.in_stock
    when '1' 
      'Доступен'
    when '0'
      'Недоступен'
    else
      'Не определен'
    end    
	end
	
end
