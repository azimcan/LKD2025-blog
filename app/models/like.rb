class Like < ApplicationRecord
  # Associations
  belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :user

  # Validations
  validates :user_id, uniqueness: { scope: [ :likeable_id, :likeable_type ], message: "You've already liked this" }

  # Callbacks
  # after_create_commit olunca stream olmuyor
  after_create :broadcast_likes_count
  after_destroy_commit :broadcast_likes_count

  private
    def broadcast_likes_count
      broadcast_update_to(
        :general_sockets,
        target: ActionView::RecordIdentifier.dom_id(likeable, :likes),
        partial: "likes",
        locals: { likeable: likeable }
      )
    end
end
