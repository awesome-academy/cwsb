class Order < ApplicationRecord
  after_create :update_booking

  attr_accessor :booking_ids

  belongs_to :coupon
  belongs_to :venue

  has_one :payment

  has_many :bookings, dependent: :destroy

  enum status: {requested: 0, pending: 1, paid: 2, closed: 3}

  def update_booking
    @booking_ids = booking_ids.split(" ")
    @booking_ids.each do |booking_id|
      booking = Booking.find_by id: booking_id
      booking.update_attributes order_id: self.id, state: "requested"
    end
  end
end
