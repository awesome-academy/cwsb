$(document).ready(function(){
  var delete_booking = $('.delete-booking');
  delete_booking.on('click',function(){
    if(window.confirm("Are you sure?")){
      var current_booking_id = $(this).attr('id').split('-')[1];
      delete_booking_with_id(current_booking_id);
    }
  });
});

function delete_booking_with_id(booking_id){
  $.ajax({
    type: 'DELETE',
    dataType: 'json',
    url: '/bookings/' + booking_id,
    success: function(data){
      if(data.message == "success"){
        location.reload();
      }
    },
    error: function(XMLHttpRequest, textStatus, errorThrown){
      alert('some error' + textStatus + ' | ' + errorThrown);
    }
  });
}
