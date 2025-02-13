module TurboHelper
  extend ActiveSupport::Concern

  included do
    before_action :set_variant

    helper_method :app_mobile?
    helper_method :app_ios?
    helper_method :app_android?
  end

  def app_mobile?
    app_ios? || app_android?
  end

  def app_ios?
    request&.user_agent =~ /Turbo Native iOS/
  end

  def app_android?
    request&.user_agent =~ /Turbo Native Android/
  end

  def set_variant
    request&.variant = :mobile if app_mobile?
  end
end
