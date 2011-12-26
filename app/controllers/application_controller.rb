class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_numeric?(s)
      !!Float(s) rescue false
  end
end
