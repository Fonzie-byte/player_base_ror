class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  around_action :switch_locale

  def switch_locale(&action)
    cookies[:lang] = params[:lang] || cookies[:lang] || I18n.default_locale
    I18n.with_locale(cookies[:lang], &action)
  end
end
