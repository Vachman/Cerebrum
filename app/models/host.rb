require "net/telnet"
require "snmp"

class Host < ActiveRecord::Base
  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"

  def connect
    Manager.new(:Host => self.hostname, :Timeout => 1, :Retries => 0)
    
  end

  def location

  end
end
