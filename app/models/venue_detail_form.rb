class VenueDetailForm < Reform::Form
  collection :images do
    property :picture
  end

  collection :working_times do
    property :day_in_week
    property :working_from
    property :working_to
    property :status
  end

  property :number_of_floors
  property :floor_space
  property :number_of_rooms
  property :number_of_desks
end
