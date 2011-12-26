class Port < ActiveRecord::Base
  belongs_to :device, :polymorphic => true
end
