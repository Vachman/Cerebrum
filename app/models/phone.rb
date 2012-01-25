class Phone < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true 
  
  validates_presence_of :number, :message => "can't be blank"
  validates_format_of :number, :with => /^\d{3}-\d{3}-\d{2}-\d{2}$/, :message => "Valid format: 916-123-45-67"
  
end
