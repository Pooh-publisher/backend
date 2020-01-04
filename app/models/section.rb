class Section < ApplicationRecord
  belongs_to :book
  validates :name, presence: true 
end
