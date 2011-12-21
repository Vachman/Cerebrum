class LogMessage < ActiveRecord::Base
  belongs_to :host
  
  scope :info_log, where('facility = ?', 'INFO')
  scope :warn_log, where('facility = ?', 'WARN')
end
