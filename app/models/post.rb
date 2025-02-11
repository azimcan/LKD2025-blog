class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :status, draft: 0, published: 1, archived: 2
end
