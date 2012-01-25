class Vlan < ActiveRecord::Base
  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"
end
