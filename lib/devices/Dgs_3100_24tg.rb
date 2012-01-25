module Dgs310024tgGigabitStackableL2ManagedSwitch
  PROMT = /DGS\-3100\#/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 24

  def ports_count
    PORST_COUNT
  end

  def setup
     create_ports
   end

  def create_ports
   1.upto(24) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
  end

  def snmp_location
    get_snmp_value '1.3.6.1.2.1.1.6.0'
  end

  def testfunc
    puts 'Des 3100-24tg'
  end
end