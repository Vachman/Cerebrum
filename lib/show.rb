module ActiveAdmin
  module Views
    module Pages  
      class Show < Base
        
        protected
        
        def default_title
           "#{resource.name}"
        end  

      end
    end
  end
end