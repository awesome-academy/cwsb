$(document).ready(function(){
  var this_check_box = $('#cb-is-free');
  var this_hidden_form = $('#hidden-form');
  $(this_check_box).click(function(){
    check_and_display_form(this_check_box, this_hidden_form);
  });
});
function check_and_display_form(checkbox, form){
  if(checkbox.val() == 1){
    checkbox.val(0);
    form.css('display', 'block');
  }else{
    checkbox.val(1);
    form.css('display','none');
  }
}
