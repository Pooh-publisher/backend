FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    user
  end
end