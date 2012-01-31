FactoryGirl.define do
  factory :employee do
    sequence(:name) { |n| "Employee#{n}" }
    position "Position"
  end
  
  factory :service do
    name "ServiceName"
    price '1,99'
  end
  
  factory :order do |o|
    sequence(:name) { |n|  "OrderName#{n}"}
    address "OrderAddress"
    due_date "11.21.22"
    contact "102-21-21"
  end
  
end