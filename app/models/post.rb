class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :status, draft: 0, published: 1, archived: 2

  validates :title, presence: true
  validates :content, presence: true
end
