# encoding: utf-8
require "./lib/netdev"
require "./lib/snmpdev"
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

                
  def update_information
    p "Up if"
    if self.new_record? || self.hostname_changed?
    p  'Up DT'
      update_device_type
    end
  end
  
  def module_name  
    self.device_type.nil? ? '' : self.device_type.name.parameterize.underscore.classify 
  end
    
  def update_device_type
    sys_descr = self.sysDescr || ''
    sys_model = self.sysModel || ''
    unless sysDescr.nil?
      self.device_type = DeviceType.find_by_name(sysDescr) || DeviceType.create(:name => sysDescr)
      self.save
    end 
  end
  
  def method_missing(key, *args)  
      begin
        p '1'
        raise if self.respond_to?(key.to_s)
        p '2'
        return unless Module.constants.include?(self.module_name.to_sym)
        p '3'
        eval("self.extend(#{self.module_name})")  
        p '4'
        eval("self.#{key}") if self.respond_to?(key.to_s)
        p '5'
        return  
        p '6'
      rescue
        p '7'
        super  
      end  
  end
end
