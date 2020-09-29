FactoryBot.define do
  factory :user do
    sequence :email do |i|
      "clara#{i}@gmail.com"
    end
    password { "123456" }
  end
end