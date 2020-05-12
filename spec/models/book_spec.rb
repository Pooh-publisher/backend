require 'rails_helper'

describe Book, type: :model do
  it do
    book = build(:book, title: nil)
    expect(book.valid?).to eq(false)
  end

  it do
    book = build(:book)
    expect(book.valid?).to eq(true)
  end
end