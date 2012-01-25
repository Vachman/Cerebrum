module DLinkDes3028pFastEthernetSwitch
  PROMT = /DES\-3028P:\d\#/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 28

  def ports_count
    PORST_COUNT
  end
  
  def setup
     create_ports
   end

   def create_ports
     1.upto(28) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
     1.upto(2) { |port_number| self.ports << Port.create(:name => "#{24+port_number} Combo #{port_number}") }
   end
  
  def testfunc
    puts 'Des 3028p'
  end
end