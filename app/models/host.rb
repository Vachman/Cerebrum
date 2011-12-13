# encoding: utf-8
require "./lib/netdev"
require "./lib/snmpdev"
require "net/telnet"
Dir['./lib/devices/*.rb'].each { |file| require file }

class Host < ActiveRecord::Base
  include NetDev
  include SnmpDev

  belongs_to :building
  belongs_to :device_type

  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"
  
  scope :roof, where('location = ?', 'Чердак')
  scope :basement, where('location = ?', 'Подвал')
  
  scope :available, where('lastms > ?', Time.now-2.minute )
  scope :unavailable, where('lastms < ? OR lastms is ? ', Time.now-2.minute, nil)
  
  alias_attribute :name, :hostname
  
  before_save :update_information 

  attr_accessor :logged_in, :telnet
         
  def update_information
    if self.new_record? || self.hostname_changed?
      update_device_type
      update_device_mac
      update_device_firmware
    end
  end

  def update_device_firmware
    self.firmware = self.snmp_get_firmware
  end
  
  def module_name  
    self.device_type.nil? ? '' : self.device_type.name.parameterize.underscore.classify 
  end
    
  def update_device_type
    sys_descr = self.sysDescr || '' 
    unless sys_descr.empty?
      self.device_type = DeviceType.find_by_name(sys_descr) || DeviceType.create(:name => sys_descr)
    end 
  end
  
  def update_device_mac
    self.mac = self.get_mac
  end
  
  
  
  def method_missing(key, *args)  
      begin
#        p "0 key- #{key}, args- #{args}"
        super if self.respond_to?(key.to_s)
#        p '2'
        return 'Module not implemented' unless Module.constants.include?(self.module_name.to_sym)
#        p '3'
        eval("self.extend(#{self.module_name})")  
#        p "-- eval self.#{key.to_s}(#{args})"
        return self.send(key,*args) if self.respond_to?(key.to_s)
#        p '5'
        return  
#        p '6'
      rescue => e
        puts "Error - #{e.message}"
      end  
  end
end
