module Dgs3627gGigabitEthernetSwitch
   PROMT = /DGS\-3627G:\d\#/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 27

  def ports_count
    PORST_COUNT
  end
  
  def setup
    create_ports
  end
  
  def create_ports
    1.upto(27) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
    1.upto(4) { |port_number| self.ports << Port.create(:name => "#{20+port_number} Combo #{port_number}") }
  end

  def testfunc
    puts 'Des 3627g'
  end
end