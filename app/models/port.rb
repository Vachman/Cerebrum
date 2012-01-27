class Port < ActiveRecord::Base
  belongs_to :device, :polymorphic => true
  has_one :link, :dependent => :destroy
  has_one :pair, :through => :link
  
  has_one :inverse_link, :class_name => "Link", :foreign_key => "pair_id"
  has_one :inverse_pair, :through => :inverse_link, :source => :port
  
  def connected_with
    if self.pair
      self.pair
    elsif self.inverse_pair
      self.inverse_pair
    end 
  end
  
  def status
    self.device.port_status(self.name) if self.device
  end   
end
