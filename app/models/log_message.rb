class LogMessage < ActiveRecord::Base
  belongs_to :host
  
  scope :info_log, where('facility = ?', 'INFO')
  scope :warn_log, where('facility = ?', 'WARN')
  
  
  
  #Logger
  Thread.new do
    File.open('/var/log/switches.log').each_line do |line|
      log_time = Time.parse(line.split[0..2].join(' '))
      hostname = line.split[3]
      host = Host.find_by_hostname(hostname)
    
      # Without time
      if line.split[4].split('.').count.eql?(4) 
        facility = line.split[5].chop
        message = line.split[6..-1].join(' ')
      #  puts "LogTime: #{log_time}, Hostname: #{hostname}, Facility: #{facility}, Message: #{message}, Host: #{host.id}"
      else # With limestamp
        facility = line.split[6].chop
        message = line.split[7..-1].join(' ')
      #  puts "-- LogTime: #{log_time}, Hostname: #{hostname}, Facility: #{facility}, Message: #{message}, Host: #{host.id}"
      end
      host.update_attribute('log_count', host.log_count += 1) if !hots.nil?
      LogMessage.create(:host => host, :log_time => log_time, :facility => facility, :message => message, :hostname => hostname)
    end
  end

end
