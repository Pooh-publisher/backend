# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#
# Indexes
#
#  index_reviews_on_book_id  (book_id)
#  index_reviews_on_state    (state)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
FactoryBot.define do
  factory :review do
    
  end
end
