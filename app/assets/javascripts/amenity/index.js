$(document).ready(function(){
  var list_checkbox = $('.cb-is-free');
  list_checkbox.click(function(){
    var this_checkbox = $(this);
    var this_amenity_id = this.id;
    var venue_id = $('.hidden-venue').val();
    set_value_for_checkbox(this_checkbox);
    console.log(this_checkbox.val());
    update_service_charge_and_is_free(venue_id, this_amenity_id, this_checkbox);
    console.log(this_checkbox.val());
  });
});
function set_value_for_checkbox(this_checkbox){
  if(this_checkbox.val() == 'true')
    this_checkbox.val(false);
  else
    this_checkbox.val(true);
}
function update_service_charge_and_is_free(venue_id, amenity_id, checkbox){
  $.ajax({
    type: 'PUT',
    dataType: 'json',
    url: '/venues/' + venue_id + '/amenities/' + amenity_id,
    data: {commit: 'Save', amenity: {is_free: checkbox.val()}},
    success: function(data){
      display_service_charge(checkbox, data, amenity_id);
    },
    error: function(XMLHttpRequest, textStatus, errorThrown){
      alert('some error' + textStatus + ' | ' + errorThrown);
    }
  });
}
function display_service_charge(checkbox, data, amenity_id){
  var free_i18n = $('#free').val();
  var price_i18n = $('#price').val();
  var this_service_charge = $('#service-charge-' + amenity_id);
  var this_form = $('#modal-user-settings-' + amenity_id);
  if(checkbox.val() == 'true'){
    this_service_charge.html(free_i18n);
  }else{
    this_service_charge.html(data.price + price_i18n + data.per + " " + data.type);
    this_form.modal('toggle');
  }
}
