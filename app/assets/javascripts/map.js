function initialize() {
  var lat = 50.0758;
  var lng = 14.4321;
  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP  
  };
  var map = new google.maps.Map(document.getElementById('map'),mapOptions);
  var input = document.getElementById('searchTextField');

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({map: map});
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    input.className = 'form-field';
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      // Inform the user that the place was not found and return.
      input.className = 'notfound';
      return;
    }
    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }
    var image = '/assets/beermarker.png';
    var beerMarker = new google.maps.Marker({
      position: place.geometry.location,
      map: map,
      icon: image
    });
    marker.setIcon(image);
    marker.setPosition(place.geometry.location);
    var address = '';
    if (place.address_components) {
      address = [
      (place.address_components[0] && place.address_components[0].short_name || ''),
      (place.address_components[1] && place.address_components[1].short_name || ''),
      (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }
    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
    var $text = $('#hidden_fields');
    $text.append(
      '<input name="place[name]" type="hidden" value="'+place.name+'"/>'+
      '<input name="place[formatted_address]" type="hidden" value="'+place.formatted_address+'" />' +
      '<input name="place[latlng]" type="hidden" value="'+place.geometry.location+'"/>' +
      '<input name="place[lat]" type="hidden" value="'+place.geometry.location.lat+'"/>' +
      '<input name="place[lng]" type="hidden" value="'+place.geometry.location.lng+'"/>' +
      '<input name="place[reference]" type="hidden" value="'+place.reference+'"/>' +
      '<input name="place[unique_google_id]" type="hidden" value="'+place.unique_google_id+'"/>' +
      '<input name="place[url]" type="hidden" value="'+place.url+'"/>' +
      '<input name="place[vicinity]" type="hidden" value="'+place.vicinity+'"/>'
    );
  });
}
google.maps.event.addDomListener(window, 'load', initialize);