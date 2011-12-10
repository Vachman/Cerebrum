module DLinkDes3028FastEthernetSwitch
  PROMPT = /DES\-3028:\d\#/
  SUCCESS = /Success./
  FAIL = { "Regexp" => /Fail!/, "Message" => "Fail!" }
  AUTH_ERROR =  { "Regexp" => /Fail!\n\rUserName:/, "Message" => "Not authenticated!" }
  
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
      connected? ? "Already connected" : self.telnet = Net::Telnet.new("Host" => self.hostname, "Telnetmode" => false, "Prompt" => PROMPT, "Timeout" => 1 )  
  end
      
  def send(options)
    connect if not connected?
    
    if options.kind_of?(Hash)
      string = options["String"]
      dontWait = options["DontWait"] if options.has_key?("DontWait")
    else
      string = options
    end
    
    if dontWait
      self.telnet.print(string)
    else
      self.telnet.cmd(string) { |output| 
        raise AUTH_ERROR["Message"] if AUTH_ERROR["Regexp"] === output
        raise FAIL["Message"] if FAIL["Regexp"] === output
        self.telnet.print("a\n") if /Next\ Entry/ === output
        return true if SUCCESS === output 
      }    
    end
  end
  
  def disconnect
    logout if logged_in? 
    self.telnet.close if connected?
    self.telnet = false
  end
  
  def login
    connect if not connected?
    self.telnet.login({"Name" => "oper", "Password" => "OblteL", "LoginPrompt" => /UserName:/, "PasswordPrompt" => /PassWord:/, "Timeout" => "1"}) { |out| raise 'Wrong username or password' if /Fail!/ === out }
    self.logged_in= true
  end
  
  def logout
    begin
      send("logo")
    rescue
    ensure
      self.logged_in= false
    end
  end
  
  def reboot
      send("String" => "reboot\ny", "DontWait" => true)
      disconnect
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