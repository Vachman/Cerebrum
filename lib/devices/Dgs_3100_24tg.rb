module Dgs310024tgGigabitStackableL2ManagedSwitch
  PROMT = /^DES-3028:\d\#$/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 24

  def ports_count
    PORST_COUNT
  end

  def testfunc
    puts 'Des 3100-24tg'
  end
end