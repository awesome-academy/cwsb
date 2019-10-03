$(document).ready(function(){
  var this_checkbox = $('#cb-is-free');
  var this_form = $('#hidden-form');
  $(this_checkbox).click(function(){
    check_and_display_form(this_checkbox,this_form);
  });
});
function check_and_display_form(checkbox, form){
  if(checkbox.val() == 1){
    checkbox.val(0);
    form.css('display', 'block');
  }else{
    checkbox.val(1);
    form.css('display', 'none');
    reset_data_after_hidden_form();
  }
}
function reset_data_after_hidden_form(){
  $('#price').val(null);
  $('#quantity').val(null);
  $('#amenity_service_charges_price_type_id').val(null);
}
