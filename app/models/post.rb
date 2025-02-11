class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy

  enum :status, draft: 0, published: 1, archived: 2

  validates :title, presence: true
  validates :content, presence: true
end
