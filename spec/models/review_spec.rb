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
require 'rails_helper'

RSpec.describe Review, type: :model do
  it do
    is_expected.to define_enum_for(:state)
      .with_values(
        pending: "pending",
        assigned: "assigned",
        approved: "approved",
        rejected: "rejected"
      )
      .backed_by_column_of_type(:string)
  end

  it do
    is_expected.to belong_to(:book)
  end
end
