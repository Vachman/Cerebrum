class Employee < ActiveRecord::Base
  
  belongs_to :department
  #has_many :phones, :as => :owner
  #accepts_nested_attributes_for :phones
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :position, :message => "can't be blank"
  validates_associated :department
  validates_format_of :PHONE, :with => /^\d{3}-\d{3}-\d{2}-\d{2}$/, :message => "Valid format: 916-123-45-67", :allow_blank => true

  def page_title 
    self.name
  end
end
