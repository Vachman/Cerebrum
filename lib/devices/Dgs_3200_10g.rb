module Dgs320010GigabitEthernetSwitch
PROMT = /^DES-3028:\d\#$/
SUCCESS = 'Success.'
FAIL = 'Fail!'
PORST_COUNT = 10

  def ports_count
    PORST_COUNT
  end
  
  def snmp_location
    get_snmp_value '1.3.6.1.2.1.1.6.0'
  end
  
  def testfunc
    puts 'Des 3200-10g Test'
  end


end