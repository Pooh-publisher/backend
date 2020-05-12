# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  content    :text             default("")
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_sections_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class Section < ApplicationRecord
  belongs_to :book
  validates :name, presence: true
end
