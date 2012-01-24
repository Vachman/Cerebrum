module Dgs320010GigabitEthernetSwitch
PROMT = /^DES-3028:\d\#$/
SUCCESS = 'Success.'
FAIL = 'Fail!'
PORST_COUNT = 10

  def ports_count
    PORST_COUNT
  end
  
  def setup
    create_ports
  end
  
  def create_ports
    1.upto(10) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
    1.upto(2) { |port_number| self.ports << Port.create(:name => "#{8+port_number} Combo #{port_number}") }
  end
  
  def snmp_location
    get_snmp_value '1.3.6.1.2.1.1.6.0'
  end
  
  def testfunc
    puts 'Des 3200-10g Test'
  end
end