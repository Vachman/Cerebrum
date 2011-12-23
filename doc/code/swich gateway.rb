def switch_gateway(ipaddr)
  if ipaddr.split('.')[2].to_i > 127 && ipaddr.split('.')[2].to_i < 136
    '192.168.128.55'
  elsif ipaddr.split('.')[2].to_i == 195
    '192.168.195.55'
  elsif ipaddr.split('.')[2].to_i == 196
    '192.168.196.50'
  elsif ipaddr.split('.')[2].to_i > 143 && ipaddr.split('.')[2].to_i < 152
    '192.168.144.55'
  end
end

error_hosts = {}

Host.where('device_type_id = ?', 9).each { |host|  
	begin
	  host.connect
	  host.login
	  host.send_cmd "enable syslog"
	  host.send_cmd "create syslog host 1 severity all facility local5 ipaddress #{switch_gateway(host.name)} state enable"
	  host.send_cmd "save"
	  host.disconnect
	  puts 
	rescue => e
	  error_hosts.merge!( host => e )
	  puts "-ERROR host: #{host.name} --> #{e.message}"
	ensure
	  
	end  
}

File.open('/tmp/hosts').each_line { |host| 
  host = Host.find_by_hostname(host.chop)
	begin
	  host.connect
	  host.login
	  host.send_cmd "config syslog host 1 severity all facility local5 ipaddress #{switch_gateway(host.name)} state enable"
	  host.send_cmd "save"
	  host.disconnect
	  puts 
	rescue => e
	  puts "-ERROR host: #{host.name} --> #{e.message}"
	ensure
	  puts error_hosts
	end  
}

ActiveRecord::Base.logger = nil

Thread.new do
  File.open('/var/log/switches.log').each_line do |line|
    log_time = Time.parse(line.split[0..2].join(' '))
    hostname = line.split[3]
    host = Host.find_by_hostname(hostname)
    # Without time
    if line.split[4].split('.').count.eql?(4) 
      facility = line.split[5].chop
      message = line.split[6..-1].join(' ')
      puts "LogTime: #{log_time}, Hostname: #{hostname}, Facility: #{facility}, Message: #{message}, Host: #{host.id}"
    else # With limestamp
      facility = line.split[6].chop
      message = line.split[7..-1].join(' ')
      puts "-- LogTime: #{log_time}, Hostname: #{hostname}, Facility: #{facility}, Message: #{message}, Host: #{host.id}"
    end
    
    LogMessage.create(:host => host, :log_time => log_time, :facility => facility, :message => message, :hostname => hostname)
  end
end