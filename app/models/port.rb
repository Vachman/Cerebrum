class Port < ActiveRecord::Base
  belongs_to :host
  belongs_to :membr
  
  validates_presence_of :number, :message => "can't be blank"
  #validates_presence_of :member, :message => "can't be blank"
  validates_presence_of :host, :message => "can't be blank"
  validates_associated :host
end
