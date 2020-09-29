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
require 'rails_helper'

describe Section, type: :model do
  it { is_expected.to belong_to(:book) }
  it { is_expected.to validate_presence_of(:name) }
end
