$(document).ready(function(){
  $('#different').on('click', function(){
    $('input:checkbox').not(this).prop('checked', this.checked);
    if ($(this).prop('checked')){
      $('.status').not(this).addClass('label-primary');
      $('.status').not(this).removeClass('label-danger');
      $('.status').not(this).html("open");
    } else {
      $('.status').not(this).addClass('label-danger');
      $('.status').not(this).removeClass('label-primary');
      $('.status').not(this).html("close");
    }
  });
  $('input:checkbox.check_working').on('click', function(){
    if ($(this).prop('checked')){
      $('.'+$(this).attr('id')).replaceWith("<label class='form-label status label label-primary "+ $(this).attr('id') +"'>open</label>");
    }
    else {
      $('.'+$(this).attr('id')).replaceWith("<label class='form-label status label label-danger "+ $(this).attr('id') +"'>close</label>");
    };
  });
});
$(document).on('click', '.delete_venue', function(){
  $(this).closest('.col-sm-12').fadeOut();
});
