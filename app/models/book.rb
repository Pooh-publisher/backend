# == Schema Information
#
# Table name: books
#
#  id                       :bigint           not null, primary key
#  category                 :string
#  description              :text
#  expected_completion_date :datetime
#  genre                    :string
#  title                    :string           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  user_id                  :bigint
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Book < ApplicationRecord
  belongs_to :user
  paginates_per 10
  has_many :sections, dependent: :destroy
  validates :title, presence: true
end
