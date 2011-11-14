class Housing < ActiveRecord::Base
  has_many :buildings 
  
  validates_presence_of :name
  validates_numericality_of :phone
  
  def page_title
    self.name
  end
end
