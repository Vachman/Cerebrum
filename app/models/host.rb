# encoding: utf-8
require "net/telnet"
require "snmp"
require "./lib/netdev.rb"

class Host < ActiveRecord::Base
  include NetDev
  
  belongs_to :building
  
  validates_presence_of :hostname, :message => "Hostname can't be blank"
  validates_uniqueness_of :hostname, :message => "Hostname must be unique"
  validates_numericality_of :porch, :allow_nil => true, :message => "is not a number" 
  
  scope :roof, where('location = ?', 'Чердак')
  scope :basement, where('location = ?', 'Подвал')
  
  scope :available, where('lastms > ?', Time.now-1.minute )
  scope :unavailable, where('lastms < ? OR lastms is ? ', Time.now-1.minute, nil)
  
  alias_attribute :name, :hostname
  
  

  def self.scan_for_new
    p "Sacnning for new hosts"
  end
  
end
