class Book < ApplicationRecord
  has_many_attached :photos

  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :published, presence: true
  validates :editor, presence: true
  validates :description, presence: true, length: { minimum: 4 }
end
