class Phone < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true 
  
  validates_presence_of :number, :message => "can't be blank"
  validates_numericality_of :number, :message => "is not a number"
  validates_length_of :number, :maximum => 15, :message => "must be 10 digits"
  
  scope :internal, where('length(number) = 4')
end
