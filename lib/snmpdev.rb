require 'snmp'

module SnmpDev                 
  def get_value(oid) 
     # return unless self.available?
      begin
        SNMP::Manager.open(:Host => self.hostname, :timeout => 1, :retries => 1) do |manager|
          manager.get_value(oid)   
        end
      rescue Exception => e
        puts e
      end  
  end
  
  def sysDescr
    get_value 'sysDescr.0'    
  end
  
  def get_mac
    get_value 'SNMPv2-SMI::mib-2.17.1.1.0'
  end

end
