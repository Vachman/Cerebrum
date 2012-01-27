class Device < ActiveRecord::Base
  has_many :ports, :as => :device, :dependent => :destroy
  
  before_save :create_port
  
  def create_port
    self.ports.build(:name => '1') if self.new_record?
  end

end
