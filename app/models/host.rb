# encoding: utf-8
require "net/telnet"
require "snmp"

class Host < ActiveRecord::Base
  belongs_to :building
  
  
  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"

  scope :roof, where('location = ?', 'Крыша')
  scope :basement, where('location = ?', 'Подвал')
  

  def connect
    Manager.new(:Host => self.hostname, :Timeout => 1, :Retries => 0)
    
  end

end
