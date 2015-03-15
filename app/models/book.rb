class Book < ActiveRecord::Base
  belongs_to :user
  serialize :favorite_quotes
  validates :title, presence: true, length: {minimum: 3}
  validates :author, presence: true
end
