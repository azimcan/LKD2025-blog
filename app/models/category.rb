class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
