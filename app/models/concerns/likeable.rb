module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable, dependent: :destroy
  end

  def like!(user)
    likes.create!(user: user)
  end

  def unlike!(user)
    likes.find_by(user: user).destroy
  end

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
