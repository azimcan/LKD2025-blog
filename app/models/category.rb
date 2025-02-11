class Category < ApplicationRecord
  validates :title, presence: true
end
