module DLinkDes3028FastEthernetSwitch
  PROMPT = /DES\-3028:\d\#/
  SUCCESS = /Success./
  FAIL = { "Regexp" => /Fail!/, "Message" => "Fail!" }
  AUTH_ERROR =  { "Regexp" => /Fail!\n\rUserName:/, "Message" => "Not authenticated!" }
  
  PORST_COUNT = 28
  
  def setup
    create_ports
  end
  
  def create_ports
    1.upto(28) { |port_number|  self.ports << Port.create(:name => port_number.to_s)}
    1.upto(2) { |port_number| self.ports << Port.create(:name => "#{24+port_number} Combo #{port_number}") }
  end
  
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
      puts "Connect to - #{self.hostname}"
      connected? ? "Already connected" : self.telnet = Net::Telnet.new("Host" => self.hostname, "Telnetmode" => false, "Prompt" => PROMPT, "Timeout" => 1 )  
  end
      
  def send_cmd(options)
    #puts '-send_cmd'
    
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
      #puts "-CMD #{string}"    
      self.telnet.cmd(string) { |output| 
        raise AUTH_ERROR["Message"] if AUTH_ERROR["Regexp"] === output
        raise FAIL["Message"] if FAIL["Regexp"] === output
        self.telnet.print("a\n") if /Next\ Entry/ === output
        puts "-- Cmd: #{string} - Ok" if SUCCESS === output 
      }    
    end
  end
  
  def snmp_get_firmware
    get_snmp_value '1.3.6.1.2.1.16.19.2.0'
  end
  
  def disconnect
    #puts '-Disconnect'    
    logout if logged_in? 
    self.telnet.close if connected?
    self.telnet = false
  end
  
  def login
  #  puts '-Login'      
    connect if not connected?
    self.telnet.login({"Name" => "oper", "Password" => "OblteL", "LoginPrompt" => /UserName:/, "PasswordPrompt" => /PassWord:/, "Timeout" => "2"}) { |out| raise 'Wrong username or password' if /Fail!/ === out }
    self.logged_in= true
  end
  
  def logout
   # puts '-Logout'   
    begin
      send_cmd "logo"
    rescue
    ensure
      self.logged_in= false
    end
  end
  
  def reboot    
      send_cmd "String" => "reboot\ny", "DontWait" => true
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

module DLinkDes3028FastEthernetSwitch::Port
  def status
    get_snmp_value "IF-MIB::ifOperStatus.#{self.name}"
  end
end