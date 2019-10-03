$(document).ready(function(){
  var active_item = $('#active-item').val();
  var selected_item =  $('ul').find( '#' + active_item);
  selected_item.addClass('active');
});
