$(document).ready ->
  initialize = ->
    input = document.getElementById('address')
    autocomplete = new (google.maps.places.Autocomplete)(input)
  google.maps.event.addDomListener window, 'load', initialize

  map = new (google.maps.Map)(document.getElementById('gmap_canvas'),
    zoom: 8
    center:
      lat: 16.067780
      lng: 108.220830)

  geocoder = new google.maps.Geocoder

  $('#address').change ->
    geocodeAddress geocoder, map

  geocodeAddress = (geocoder, resultsMap) ->
    address = document.getElementById('address').value
    geocoder.geocode { 'address': address }, (results, status) ->
      if status == 'OK'
        resultsMap.setCenter results[0].geometry.location
        marker = new (google.maps.Marker)(
          map: resultsMap
          position: results[0].geometry.location)

  geocodeAddress geocoder, map
