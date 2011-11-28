require "snmp"

module SnmpDev
  def walk(oid)
    `snmpwalk -r 1 -t 1 -v2c -c public -Ov #{self.hostname} #{oid} `
  end
  
  def sysDescr
    walk('sysDescr').split(' ')[1]
  end
end