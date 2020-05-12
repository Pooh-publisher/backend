FactoryBot.define do
  factory :book do
    sequence :title do |i|
      "The tree #{i}"
    end
    description { "Book Description" }
    user
  end
end