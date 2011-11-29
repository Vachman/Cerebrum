# encoding: utf-8
require "./lib/netdev"
require "./lib/snmpdev"

class Host < ActiveRecord::Base
  include NetDev
  include SnmpDev
  
  belongs_to :building
  belongs_to :device_type
  
  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"
  validates_numericality_of :porch, :allow_nil => true, :message => "is not a number" 
  
  scope :roof, where('location = ?', 'Чердак')
  scope :basement, where('location = ?', 'Подвал')
  
  scope :available, where('lastms > ?', Time.now-1.minute )
  scope :unavailable, where('lastms < ? OR lastms is ? ', Time.now-1.minute, nil)
  
  alias_attribute :name, :hostname
  
  after_create  :update_information
                
  def update_information
    update_device_type
  end
  
  def update_device_type
    sys_descr = self.sysDescr || ''
    sys_model = self.sysModel || ''
    unless sysDescr.nil?
      self.device_type = DeviceType.find_by_name(sysDescr) || DeviceType.create(:name => sysDescr, :model => sys_model)
      self.save
    end 
    
    
  end

  def self.scan_for_new
    p "Sacnning for new hosts"
  end
  
end
