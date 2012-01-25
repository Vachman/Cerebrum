module Dgs3612gGigabitEthernetSwitch
  PROMT = /DGS\-3612G:\d\#/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 12

  def ports_count
    PORST_COUNT
  end

  def setup
    create_ports
  end
  
  def create_ports
    1.upto(12) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
    1.upto(4) { |port_number| self.ports << Port.create(:name => "#{8+port_number} Combo #{port_number}") }
  end
  
  def testfunc
    puts 'Des 3612g'
  end
end