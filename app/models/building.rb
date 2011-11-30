# encoding: utf-8
class Building < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "Не может быть пустым"
  
  belongs_to :housing
  has_many :hosts, :order => "porch ASC"

  def page_title
    self.name
  end
end
