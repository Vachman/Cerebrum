class Port < ActiveRecord::Base
  belongs_to :device, :polymorphic => true
  
  def status
    self.device.port_status(self.name) if self.device
  end   
end
