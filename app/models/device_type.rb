class DeviceType < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :hosts
  has_many :actions
end
