$(function(){
  $(window).on('load', function(){
    var options = {
      types: ['(cities)']
    };
    var input = document.getElementById('pac-input-home');
    var searchBox = new google.maps.places.Autocomplete(input);
  });
});
