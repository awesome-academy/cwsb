class Notification < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> {where status: false}
  scope :newest, -> {order created_at: :desc}
  scope :by_receiver, -> receiver_id {where receiver_id: receiver_id}

  after_create_commit {NotificationBroadcastJob.perform_now(Notification.unread.count,self)}

  def load_message
    case notifiable_type
    when Booking.name
      "#{Booking.name}: #{I18n.t "notification.has"} #{message} #{time_ago_in_words(created_at)}
        #{I18n.t "notification.ago"} "
    end
  end
end
