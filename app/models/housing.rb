class Housing < ActiveRecord::Base
  has_many :buildings 
  
  validates_presence_of :name
#  validates_numericality_of :phone
  has_many :phones, :as => :owner
  accepts_nested_attributes_for :phones, :allow_destroy => true
  
  def page_title
    self.name
  end
end
