//https://developers.google.com/maps/documentation/javascript/tutorial

function initMap() {

  var options = {
    zoom: 2,
    center: {
      lat: 20.0,
      lng: 0.0
    }
  }

  var map = new google.maps.Map(document.getElementById('map-canvas'), options);
  var markers = [];
  var globalmeteorites = [];
  var globalmeteoritesData =[];
  var points = [];
  var marker, infoWindow;
  var heatmap = new google.maps.visualization.HeatmapLayer({
    data : [],
    map : map,
    radius : 50
  });

  function drawMap(meteorites) {
    meteoritesData = [[],[],[],[],[]];
    heatmap.setData([])
    heatmap.setData(getPoints());
    globalmeteorites = meteorites;
    globalmeteoritesData = meteoritesData;

    function getPoints() {
      var points = [];
      for (var i = 0; i < meteorites.length; i++) {
        var mymeteorite = meteorites[i];
        points.push({
          location: new google.maps.LatLng(Number(mymeteorite.latitude), Number(mymeteorite.longitude)),
          weight: meteoritesData[2][i] * 1000
        });
      }
      return points;
    }

    //clears the existing markers
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    //creates new markers
    for (var i = 0; i < meteorites.length; i++) {
      var mymeteorite = meteorites[i];
      var position = {
        lat: Number(mymeteorite.latitude),
        lng: Number(mymeteorite.longitude)
      };
      var title = mymeteorite.name;
      var content = '<div id="iw-container">' +
                      '<div class="iw-title"><h3>'+mymeteorite.name+'</h3></div>' +
                      '<div class="iw-content">' +
                        '<h4 class="iw-subTitle">Details</h4>' +
                        '<p>'+'<b>Mass:</b> '+mymeteorite.mass+
                        '<br>'+'<b>Year:</b> '+mymeteorite.year+
                        '</p>' +
                      '</div>' +
                    '</div>';


      marker = addMarker(position, title,content);
      markers.push(marker);
    }
  }

  function addMarker(position, title, content) {
    var marker = new google.maps.Marker({
      map: map,
      position: position,
      clickable: true,
      title: title
    });
    var infoWindow = new google.maps.InfoWindow({
      content: content,
      maxWidth: 350
    });
    //opens info window
    google.maps.event.addListener(marker, 'click', function() {
      infoWindow.open(this.getMap(), this);
    });
    //closes info window
    google.maps.event.addListener(map, 'click', function() {
      infoWindow.close();
    });
    return marker;
  }

  $(document).ready(function() {
    $.ajax({
      url: "home/refreshHomeData",
      type: "get",
      data: {
      },
      success: function(response) {
        drawMap(response.meteorites);
      }
    })
  })

  $("#meteorite").keyup(function() {
    myAjax();
  })

  function myAjax() {
    $.ajax({
      url: "index/refreshHomeData",
      type: "get",
      data: {
        letter: $("#meteorite").val(),
      },
      success: function(response) {
        drawMap(response.meteorites);
      }
    })
  }
   //callback functions for the buttons on the map
    $("#toggleMarker").click(function() {
          var shouldRemoveMarkers = false;
          for (var i = 0; i < markers.length; i++) {
            if(markers[i].getMap() != null) {
                 shouldRemoveMarkers = true;
              }
          }

          if(shouldRemoveMarkers){
            for (var i = 0; i < markers.length; i++) {
              (markers[i]).setMap(null);
            }
          } else {
                      meteorites = globalmeteorites;
                      meteoritesData = globalmeteoritesData;
                      for (var i = 0; i < meteorites.length; i++) {
                        var mymeteorite = meteorites[i];
                        var position = {
                          lat: Number(mymeteorite.latitude),
                          lng: Number(mymeteorite.longitude)
                        };
                        var title = mymeteorite.name;
                        var content = '<div id="iw-container">' +
                                        '<div class="iw-title"><h3>'+mymeteorite.name+'</h3></div>' +
                                        '<div class="iw-content">' +
                                          '<div class="iw-subTitle">Details</div>' +
                                          '<p>'+'<b>Mass:</b> '+mymeteorite.mass+
                                          '<br>'+'<b>Year:</b> '+mymeteorite.year+
                                          '</p>' +
                                        '</div>' +
                                      '</div>';


                        marker = addMarker(position, title,content);
                        markers.push(marker);
                      }
          }

    })

    $("#toggleHeatmap").click(function() {
          heatmap.setMap(heatmap.getMap() ? null : map);
    })

    $("#changeOpameteorite").click(function() {
          heatmap.set('opameteorite', heatmap.get('opameteorite') ? null : 0.4);
    })

    $(window).resize(function() {
      google.maps.event.trigger(map, "resize");
    });

}
