module BookingHelper
  def input_state booking
    content_tag :div, class: ["switch-toggle", "well"] do
      content_tag :input, id: "rejected-<%= booking.id %>",
        name: booking.id, type: "radio", class:"state"
      content_tag :label do
        Booking.states.keys[2]
      end
    end
  end
end


# <div class="switch-toggle well">
#   <input id="rejected-<%= booking.id %>" value="<%= Booking.states.keys[2] %>" name="<%= booking.id %>" type="radio" class="state">
#   <label for="rejected-<%= booking.id %>" onclick=""><%= Booking.states.keys[2] %></label>
#   <input id="requested-<%= booking.id %>" name="<%= booking.id %>" type="radio" class="state" value="<%= Booking.states.keys[1] %>" disabled>
#   <label for="requested-<%= booking.id %>" onclick=""><%= Booking.states.keys[1] %></label>
#   <input id="accepted-<%= booking.id %>" name="<%= booking.id %>" type="radio" class="state" value="<%= Booking.states.keys[3] %>">
#   <label for="accepted-<%= booking.id %>" onclick=""><%= Booking.states.keys[3] %></label>
#   <a class="btn btn-primary"></a>
# </div>
