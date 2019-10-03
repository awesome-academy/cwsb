module ApplicationHelper
  def full_title page_title = ""
    base_title = t "layout.base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def count_notification_read
    if user_signed_in?
      current_noti_unread = @count_notification_unread
        current_noti_unread
    end
  end

  def load_link status_message
    if user_signed_in?
      if status_message == t("notification.status_message")
        store_bookings_path
      else
        booking_histories_path
      end
    end

  end
end
