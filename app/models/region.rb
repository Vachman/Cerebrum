class Region < ActiveRecord::Base
  belongs_to :server
  has_many :vlans
  has_many :buildings
  
  accepts_nested_attributes_for :vlans, :allow_destroy => true
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :server, :message => "can't be blank"
    
  def page_title
    self.name
  end

end
