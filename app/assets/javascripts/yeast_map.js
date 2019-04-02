$(function () {
  var map = L.map('yeast_map').setView([0,0], 1);

  var CartoDB_PositronNoLabels = L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_nolabels/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="http://cartodb.com/attributions">CartoDB</a>',
    subdomains: 'abcd',
    maxZoom: 19
  }).addTo(map);

  var yeast_types = $('#yeast_map').data('yeast-types');
  var yeast_type_markers = [];

  $.each(yeast_types, function (index, yeast_type) {
    var marker = L.marker([yeast_type.y, yeast_type.x]).addTo(map);

    marker.bindPopup(
      "<b><a href='/yeast_types/" + yeast_type.id + "'>" + yeast_type.sequence_name + "</a></b>"
    );

    yeast_type_markers.push(marker);
  });

  // ---> Geolocation marker
  function onLocationFound(e) {
    // Accuracy radius indicator
    var radius = e.accuracy / 2;
    L.circle(e.latlng, {radius: radius, stroke: false}).addTo(map);

    // Actual location marker
    var location_marker_options = {
      radius: 6,
      color: 'white',
      fillColor: '#3388ff',
      fillOpacity: 1,
      weight: 2
    }
    L.circleMarker(e.latlng, location_marker_options).addTo(map)
      .bindPopup("You are within " + radius + " meters from this point").openPopup();
  }
  map.on('locationfound', onLocationFound);

  function onLocationError(e) {
    console.log(e.message);
  }
  map.on('locationerror', onLocationError);
});
