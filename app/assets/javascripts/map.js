var MAP = MAP || {};

MAP.search = (function(){
  var handler = Gmaps.build('Google');

  return {

    buildMap: handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(lat, lon){
      var markers = handler.addMarkers([
        {
          "lat": lat,
          "lng": lon,
          "picture": {
            "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
            "width":  32,
            "height": 32
          },
          "infowindow": "hello!"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }),

    hello: console.log('hello')
  }


})();


$(document).ready(function(){
  if ($('#searches-index').length) {
    MAP.search
  }
})



