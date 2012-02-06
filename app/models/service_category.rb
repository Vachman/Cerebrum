class ServiceCategory < ActiveRecord::Base
  has_many :services, :conditions => "in_stock = 1"
end
