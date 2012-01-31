class Order < ActiveRecord::Base
  has_many :order_services
  accepts_nested_attributes_for :order_services, :allow_destroy => true

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :due_date, :message => "can't be blank"  
  validates_presence_of :address, :message => "can't be blank"
  validates_presence_of :contact, :message => "can't be blank"
end
