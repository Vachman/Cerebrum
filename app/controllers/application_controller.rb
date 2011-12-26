class ApplicationController < ActionController::Base
  protect_from_forgery
  
  class String
    def is_numeric?  
      !!Float(self) rescue false    
    end  
  end
end
