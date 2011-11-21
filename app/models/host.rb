# encoding: utf-8
require "net/telnet"
require "snmp"

class Host < ActiveRecord::Base
  belongs_to :building
  
  
  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"
  validates_numericality_of :porch, :message => "is not a number"

  scope :roof, where('location = ?', 'Чердак')
  scope :basement, where('location = ?', 'Подвал')
  

  def connect
    Manager.new(:Host => self.hostname, :Timeout => 1, :Retries => 0)    
  end

  alias_attribute :name, :hostname
end
