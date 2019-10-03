class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def update
    Notification.by_receiver(current_user.id).unread.update status: true
  end
end
