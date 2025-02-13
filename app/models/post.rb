class Post < ApplicationRecord
  include Likeable


  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy

  enum :status, draft: 0, published: 1, archived: 2

  CONTENT_MAX_LENGTH = 1000

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: CONTENT_MAX_LENGTH }
end
