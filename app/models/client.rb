class Client < ActiveRecord::Base
  has_many :phones, :as => :owner 
  
  validates_presence_of :name, :message => "can't be blank"
  
  scope :companys, where(:company => true)
  scope :individuals, where(:company => false)  
end
