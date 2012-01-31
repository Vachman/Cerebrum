# encoding: utf-8  
class Service < ActiveRecord::Base  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :price, :message => "can't be blank"
  
  scope :internet, Service.where('category = ?', 'Интернет')
  scope :telephony, Service.where('category = ?', 'Телефония')
  scope :tv, Service.where('category = ?', 'Телевидение')
end
