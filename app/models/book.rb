class Book < ApplicationRecord
  has_many_attached :photos

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :published, presence: true
  validates :editor, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
