module NcDev
  # Connection timeout
  TIMEOUT = 120
  
  
  def do(cmd)
    
  end
  
  def open
    fd = IO.popen("nc #{self.hostname} 23","a+") if self.available?
  end
end