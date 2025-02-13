class ApplicationController < ActionController::Base
  rate_limit to: 10, within: 3.minutes, with: -> { redirect_to root_path, alert: "Try again later." }

  include Authentication
  include TurboHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
end
