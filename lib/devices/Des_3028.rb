module DLinkDes3028FastEthernetSwitch
  PROMPT = /DES\-3028:\d\#/
  SUCCESS = /Success./
  FAIL = { "Regexp" => /Fail!/, "Message" => "Fail!" }
  
  PORST_COUNT = 28
  
  # Conected ?
  def connected?
    self.telnet ? true : false
  end

  # Logged in ? 
  def logged_in?
    self.logged_in ? true : false
  end   
    
  # Connect to switch
  def connect
      self.telnet = Net::Telnet.new("Host" => self.hostname, "Telnetmode" => false, "Prompt" => PROMPT, "Timeout" => 1 ) unless connected?
  end
      
  def send(string)
    connect if not connected?
    self.telnet.cmd(string) { |output| 
      raise FAIL["Message"] if FAIL["Regexp"] === output
      self.telnet.print("a\n") if /Next\ Entry/ === output
      return true if SUCCESS === output
    } 
  end
  
  def disconect
    logout if logged_in? 
    self.telnet.close if connected?
  end
  
  def login
    login({"Name" => "oper", "Password" => "OblteL", "LoginPrompt" => /UserName:/, "PasswordPrompt" => /PassWord:/, "Timeout" => "1"}) { |out| raise 'Wrong username or password' if /Fail!/ === out }
    self.logged_in= true
  end
  
  def logout
    send("logo")
    self.logged_in= false
  end
  
  def reboot
    send("reboot\ny")
  end
  
  def upload_log
  end
  
  def upload_config
  end 
  
  def update_firmware
  end
  
  def update_bootloader
  end
  
  
  def ports_count
    PORST_COUNT
  end

  def testfunc
    puts 'Des 3028 '
  end

  
end