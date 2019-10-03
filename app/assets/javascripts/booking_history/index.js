$(document).ready(function(){
  var list_of_booking_state = ["request", "accept", "reject"];
  for(var i = 0; i < list_of_booking_state.length; i++){
    var times = $('#times-' + list_of_booking_state[i]).val();
    var total_prices = [];
    var booking_ids = [];
    display_total_price(times, total_prices, booking_ids, list_of_booking_state[i]);
  }
});

function display_total_price(times, total_prices, booking_ids, state_of_booking){
  for(var i = 0; i< times; i++){
    total_prices[i+1] = 0;
    booking_ids[i+1] = "";
    var order_id = $('#order_id-'+ state_of_booking + '-' + i).val();
    var display_total_price = $('#total-price-'+ state_of_booking + '-' + order_id);
    var times_child = $('#times-child-' + state_of_booking + '-' + order_id).val();
    for(var j=0; j< times_child; j++){
      var booking_id = $('#booking-' + state_of_booking + '-' + i + '-' + j).val();
      booking_ids[i+1] += (booking_id + " ");
      var quantity = $('#quantity-' + booking_id);
      var price = $('#price-' + booking_id).text().split('$')[1];
      var total = parseFloat(quantity.text() * price);
      total_prices[i+1] += total;
    }
    display_total_price.html('$ ' + total_prices[i+1]);
  }
}
