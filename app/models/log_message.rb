class LogMessage < ActiveRecord::Base
  belongs_to :host
  
  scope :info, where('facility = ?', 'INFO')
  scope :warn, where('facility = ?', 'WARN')
end
