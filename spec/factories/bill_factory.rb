FactoryGirl.define do
  factory :bill do
   invoice_number "123456"
   current_due 24.00
   due_date "11/12/2013"
  end
end
