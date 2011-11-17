module ActiveAdmin
  module Views
    module Pages  
      class Index < Base
         def title    
           I18n.t "active_admin.#{self.resource_class.name.downcase.pluralize}", :default => active_admin_config.plural_resource_name
         end 
      end
    end
  end
end
