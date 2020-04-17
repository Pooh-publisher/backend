class Book < ApplicationRecord
  belongs_to :user
  paginates_per 10
  has_many :sections, dependent: :destroy
  validates :title, presence: true
end
