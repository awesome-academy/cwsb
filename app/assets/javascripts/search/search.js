$(function(){
  $(window).on('load', function(){
    var options = {
      types: ['(cities)']
     };
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.Autocomplete(input, options);
    var markers = [];

    latitude = 0;
    longitude = 0;
    getUserLocationByService();

    searchBox.addListener('place_changed', function(e) {
      var place = searchBox.getPlace();
      if (!place.geometry) {
        alert("Please enter a valid city");
      }
      else {
        form = $('#search-space-form');
        form.submit();
      }
    });

    $('#search-space-form').on('keypress', function(e) {
      return e.which !== 13;
    });

    handler = Gmaps.build('Google');
    handler.buildMap({
        provider: {
          disableDefaultUI: true
          // pass in other Google Maps API options here
        },
        internal: {
          id: 'map'
        }
      },
      function(){
        points = $('#markers-on-map').val();
        if (points == 'null' || points == '[]') {
          setMapToPosition(parseFloat($('#current_lat').val()),
            parseFloat($('#current_lng').val()));
        }
        else {
          markers = [];
          markers = handler.addMarkers(JSON.parse(points));
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
        }
      }
    );

    function getUserLocationByService(){
      $.ajax({
        url: 'http://freegeoip.net/json/',
        async: false
      }).then(function(data){
        $('#current_lat').val(data.latitude);
        $('#current_lng').val(data.longitude);
      });
    }

    function setMapToPosition(lat, lng){
      centre_pos = {'lat': lat, 'lng': lng}
      handler.map.centerOn(centre_pos);
      handler.getMap().setZoom(17);
    };

    $('.btn-filter').on('click', function (e) {
      e.preventDefault();
      var target = $(this).data('target');
      if (target != 'all') {
        $('#search-space-result #space_type').css('display', 'none');
        $('#search-space-result #space_type[data-status="' + target + '"]').fadeIn('slow');
      } else {
        $('#search-space-result #space_type').css('display', 'none').fadeIn('slow');
      }
    });
  });

});

$(document).ready(function() {
  $('.scroll-y').scroll(function() {
    if ($(this).scrollTop() > 50) {
      $('#fixed-top-last').addClass('fixed-top-last');
    } else {
      $('#fixed-top-last').removeClass('fixed-top-last');
    }
  });
});
