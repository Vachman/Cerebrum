require 'snmp'

module SnmpDev                 
  def get_snmp_value(oid) 
     # return unless self.available?
      begin
       SNMP::Manager.open(:Host => self.hostname, :timeout => 1, :retries => 1) do |manager|
          manager.get_value(oid)   
        end
      rescue Exception => e
        puts e
      ensure
      
      end  
  end
  
  
  
  def sysDescr
    get_snmp_value 'sysDescr.0'    
  end
  
  def get_mac
    mac = get_snmp_value 'IF-MIB::ifPhysAddress.1'
    mac.unpack("H2H2H2H2H2H2").join(":")
  end

end
