namespace :update do
  desc "Auto reject"
  task booking: :environment do
    date = Time.current + Settings.day_reject.days
    Booking.load_resourse_to_reject(date).each do |booking|
      booking.update_attributes state: Booking.states["rejected"]
      booking.order.update_attributes status: Order.statuses["closed"]
    end
  end
end
