module DLinkDes3028pFastEthernetSwitch
  PROMT = /^DES-3028:\d\#$/
  SUCCESS = 'Success.'
  FAIL = 'Fail!'
  PORST_COUNT = 28

  def ports_count
    PORST_COUNT
  end

  def testfunc
    puts 'Des 3028p'
  end
end