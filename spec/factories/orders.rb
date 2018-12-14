FactoryBot.define do
  factory :order, class: Order do
    user 1
    posting 1
    completed false
  end
end
