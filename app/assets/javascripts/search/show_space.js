$(function(){
  $(window).on('load', function(){
    var lat = $('#mark_lat').val();
    var long = $('#mark_long').val();
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
      markers = handler.addMarkers([
        {
          'lat': lat,
          'lng': long
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(16);
    });
  });
});
