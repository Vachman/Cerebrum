module Dgs320010GigabitEthernetSwitch
PROMT = /^DES-3028:\d\#$/
SUCCESS = 'Success.'
FAIL = 'Fail!'
PORST_COUNT = 10

  def ports_count
    PORST_COUNT
  end

  def testfunc
    puts 'Des 3200-10g Test'
  end


end