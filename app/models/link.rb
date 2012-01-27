class Link < ActiveRecord::Base
  belongs_to :port
  belongs_to :pair, :class_name => "Port"
end