module NetDev
  def available?
    `/usr/fping -a -t 50 "#{self.hostname}"`.empty? ? false : true  
  end
  
  def update_lastms
    self.update_attribute('lastms',Time.now) if self.has_attribute?('lastms')
  end
  
end