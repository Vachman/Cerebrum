class OrderService < ActiveRecord::Base
  belongs_to :service
  belongs_to :order
end