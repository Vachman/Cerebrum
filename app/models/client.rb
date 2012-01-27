class Client < ActiveRecord::Base
  belongs_to :building
  has_many :devices
  accepts_nested_attributes_for :devices, :allow_destroy => true
  
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :building, :message => "can't be blank"
  
  scope :companys, where(:company => true)
  scope :individuals, where(:company => false)  
end
