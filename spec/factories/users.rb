FactoryBot.define do
  factory :user, class: User do
    email "user@test.com"
    password "secretpassword"
  end
end
