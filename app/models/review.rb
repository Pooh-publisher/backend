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
class Review < ApplicationRecord
  include AASM

  enum state: {
    pending: "pending",
    assigned: "assigned",
    approved: "approved",
    rejected: "rejected"
  }

  aasm column: :state, enum: true do
    state :pending, initial: true
    state :assigned, :approved, :rejected

    event :reviewing do
      transitions from: :pending, to: :assigned
    end

    event :approve do
      transitions from: :assigned, to: :approved
    end

    event :reject do
      transitions from: :assigned, to: :rejected
    end
  end

  belongs_to :book

end
