class Port < ActiveRecord::Base
  belongs_to :device, :polymorphic => true
  
  def method_missing(key, *args)  
      begin
#        p "0 key- #{key}, args- #{args}"
        super if self.respond_to?(key.to_s)
#        p '2'
        return 'Module not implemented' unless Module.constants.include?(self.device.module_name.to_sym)
#        p '3'
        eval("self.extend(#{self.device.module_name}::Port)")  
#        p "-- eval self.#{key.to_s}(#{args})"
        return self.send(key,*args) if self.respond_to?(key.to_s)
#        p '5'
        return  
#        p '6'
      rescue => e
        puts "Error - #{e.message}"
      end  
  end
  
end
