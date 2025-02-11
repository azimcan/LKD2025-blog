class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  MAX_CONTENT_LENGTH = 256
  validates :content, presence: true, length: { minimum: MAX_CONTENT_LENGTH }
end
