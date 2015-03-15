require 'rails_helper'

RSpec.describe Book, type: :model do

  it "has a valid factory" do
    expect(create(:book)).to be_valid
  end

  it "is invalid without title" do
    book = build(:book, title: nil)
    book.valid?
    expect(book).to be_invalid
  end

  it "is invalid without author" do
    book = build(:book, author: nil)
    book.valid?
    expect(book).to be_invalid
  end

end
