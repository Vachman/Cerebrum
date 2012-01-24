class Client < ActiveRecord::Base
  belongs_to :building
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :building, :message => "can't be blank"
  
  scope :companys, where(:company => true)
  scope :individuals, where(:company => false)  
end
