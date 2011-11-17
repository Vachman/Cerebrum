# encoding: utf-8
class Department < ActiveRecord::Base
  has_many :employees
    
  validates_presence_of :name
  
end
