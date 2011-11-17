module ActiveAdmin
  module Views
    module Pages  
      class Show < Base
        
        protected
        
        def default_title
          resource.respond_to?('name') ? "#{resource.name}" : "#{resource.id}" 
        end  

      end
    end
  end
end