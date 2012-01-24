class Employee < ActiveRecord::Base
  
  belongs_to :department
  #has_many :phones, :as => :owner
  #accepts_nested_attributes_for :phones
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :position, :message => "can't be blank"
  validates_associated :department

  def page_title 
    self.name
  end
end
