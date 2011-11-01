class CactiHost < ActiveRecord::Base
  self.abstract_class = true
  set_table_name "host"
  establish_connection :cacti
end
