class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :content, presence: true
  validates :title, length: {in: 1..200}, presence: true
end
