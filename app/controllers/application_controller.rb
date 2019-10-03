class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_notification

  include GeneralHelper

  around_action :skip_bullet

  def skip_bullet
    Bullet.enable = false
    yield
  ensure
    Bullet.enable = true
  end

  def load_notification
    if user_signed_in?
      @notifications = Notification.by_receiver(current_user.id).newest
      @count_notification_unread = @notifications.unread.size
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_in, keys: [:name, :email]
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email,
      :password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update,
      keys: [:name,:email, :password, :password_confirmation,
      :current_password, :bio, :company, :position, :skill,
      :phone_number, :facebook, :google, :twitter]
  end
end
