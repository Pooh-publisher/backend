FactoryBot.define do
  factory :section do
    name { FFaker::Lorem.sentence }
    content { FFaker::Lorem.paragraph }
    book
  end
end

