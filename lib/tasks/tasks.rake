task :check_availability => :environment do
  hosts = "" 
  Host.all.each { |h| hosts << h.hostname << ' ' }
  available = `fping -a -t 50 -p 20 -i 10 #{hosts};true 2>/dev/null`
  available.each_line { |host| h = Host.find_by_hostname(host.chop); h.update_attribute('lastms',Time.now)  }
end 


