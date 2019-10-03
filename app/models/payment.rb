class Payment < ApplicationRecord
  belongs_to :order

  def paypal_url(return_path)
    values = {
      business: Settings.paypal_business,
      cmd: "_cart",
      upload: 1,
      return: "#{Settings.ngrok_host}#{return_path}",
      invoice: id,
      notify_url: "#{Settings.ngrok_host}/hook"
    }
    order.bookings.accepted.each_with_index do |booking, index|
      values.merge!({
        "amount_#{index+1}":
          booking.select_price(booking.space, booking.booking_type_id),
        "item_name_#{index+1}": booking.space_name,
        "item_number_#{index+1}": booking.id,
        "quantity_#{index+1}": booking.quantity,
      })
    end
    "#{Settings.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
