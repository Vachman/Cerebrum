# encoding: utf-8
class Building < ActiveRecord::Base
  belongs_to :housing
  has_many :hosts, :order => "porch ASC"
  has_many :clients

  validates_presence_of :name, :on => :create, :message => "Не может быть пустым"
  
  def page_title
    self.name
  end
end
