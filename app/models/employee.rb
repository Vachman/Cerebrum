class Employee < ActiveRecord::Base
  has_many :phones, :as => :owner
  belongs_to :department
  accepts_nested_attributes_for :phones
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :position, :message => "can't be blank"
  validates_associated :department

  def page_title 
    self.name
  end
end
