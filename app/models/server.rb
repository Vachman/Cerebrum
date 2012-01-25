class Server < ActiveRecord::Base
  belongs_to :building
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :hostname, :message => "can't be blank"
end
