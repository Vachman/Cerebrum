# encoding: utf-8  
class Order < ActiveRecord::Base
	has_many :order_services
	accepts_nested_attributes_for :order_services, :allow_destroy => true

  has_many :services, :through => :order_services
  
	validates_presence_of :name, :message => "can't be blank"
	validates_presence_of :contact, :message => "can't be blank"
	validates_presence_of :address, :message => "can't be blank"
	
	scope :new_orders, Order.where('status = ?', 'Новый')
	scope :processed_orders, Order.where('status = ?', 'Обработан')
	scope :completed_orders, Order.where('status = ?', 'Завершен')
	
	def status_tag
	  case self.status
    when 'Обработан' 
      :warn
    when 'Завершен'
      :ok
    when 'Новый'
      :error
    else
      :error
    end    
	end

end

=begin
	TODO сделать нормальный dateinput
	TODO default status => new 
=end
