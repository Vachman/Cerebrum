module DLinkDes3010gFastEthernetSwitch
  PROMT = /DES\-3010G:\d\#/
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
  end

  def testfunc
    puts 'Dgs 3010g'
  end
end