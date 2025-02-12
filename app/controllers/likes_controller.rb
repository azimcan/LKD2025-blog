class LikesController < ApplicationController
  before_action :set_likeable, only: [ :create, :destroy ]

  def create
    @likeable.like!(Current.user)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @likeable.unlike!(Current.user)

    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def set_likeable
      likeable_class = nil
      likeable_id = nil

      params.each do |name, value|
        next unless /(.+)_id$/.match?(name)

        likeable_class = name.match(/(.+)_id$/)[1].classify.constantize
        likeable_id = value.to_i
      end

      @likeable = likeable_class.find(likeable_id)
    end
end
