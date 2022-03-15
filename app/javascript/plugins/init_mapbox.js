import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


// const addDirectionToMap = (map) => {
//   var directions = new MapboxDirections({
//     accessToken: mapboxgl.accessToken
//   });
//   map.addControl(directions, 'top-left');
// }

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker[0], marker[1]]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    navigator.geolocation.getCurrentPosition(position => {
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/light-v10',
        center: [5.37639, 43.29667],
        zoom: 14
      });

      async function getAndDisplayRoute(start, end, steps = []) {
        // makes a directions request using walking profile
        let coordsString;
        if (steps.length > 0) {
          const stepsStr = steps.map((step) => {
            return `${step[0]},${step[1]}`;
          }).join(";");
          coordsString = `${start[0]},${start[1]};${stepsStr};${end[0]},${end[1]}`;
        } else {
          coordsString = `${start[0]},${start[1]};${end[0]},${end[1]}`;
        }
        // const coordsString =
        //   ? `${start[0]},${start[1]};${steps.reduce((resultStr, step) => resultStr + `${step[0]},${step[1]}` + ";")}${end[0]},${end[1]}`
        //   : `${start[0]},${start[1]};${end[0]},${end[1]}`
        const query = await fetch(
          `https://api.mapbox.com/directions/v5/mapbox/walking/${coordsString}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
          { method: 'GET' }
        );
        const json = await query.json();
        const data = json.routes[0];

        const timeContainer = document.querySelector("#time-remaining")
        const timeAvailable = Number(timeContainer.dataset.timeAvailable)
        const timePlacesPlanned = Number(timeContainer.dataset.timePlacesPlanned)
        const timeWalking = Number(data.duration.toString().split('.')[0])

        const timeRemaining = ((timeAvailable - (timePlacesPlanned + timeWalking))/60) - 60
        if (timeContainer) {
          timeContainer.innerHTML=`After your exploration, you will still have <span id="textcolor"> ${timeRemaining.toString().split('.')[0]} minutes available </span> at your destination for freestyle!`
        }

        // console.dir(timeContainer)
        const route = data.geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };

        // if the route already exists on the map, we'll reset it using setData
        if (map.getSource('route')) {
          map.getSource('route').setData(geojson);
        }
        // otherwise, we'll make a new request
        else {
          map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: geojson
            },
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': '#3887be',
              'line-width': 5,
              'line-opacity': 0.75
            }
          });
        }
        // add turn instructions here at the end
      }
      const displayPoint = (coords, color, name) => {
        // Add starting point to the map
        map.addLayer({
          id: name,
          type: 'circle',
          source: {
            type: 'geojson',
            data: {
              type: 'FeatureCollection',
              features: [
                {
                  type: 'Feature',
                  properties: {},
                  geometry: {
                    type: 'Point',
                    coordinates: coords // this needs to be an array of coordinates (beware, not an object)
                  }
                }
              ]
            }
          },
          paint: {
            'circle-radius': 10,
            'circle-color': color
          }
        });
      }

      // dans l'idéal, il faudrait harmoniser pour que les méthodes prennent toutes soit un tableau soit un objet. Celle-ci prend un objet.
      const displayMarkers = (markers, markerColor = "yellow") => {
        markers.forEach((place) => {
          const popup = new mapboxgl.Popup().setHTML(place.info_window);
          new mapboxgl.Marker({ color: markerColor })
            .setLngLat([
              place.lng,
              place.lat
            ])
            .setPopup(popup)
            .addTo(map);
        });
      }
      // READ DATA COMING FROM BACKEND
      const navStartingCoords = [position.coords.longitude, position.coords.latitude];
      const navEndingCoords = [
        JSON.parse(mapElement.dataset.nav)[1]?.lng,
        JSON.parse(mapElement.dataset.nav)[1]?.lat
      ]
      const navMarkers = [navStartingCoords, navEndingCoords]

      const visitedStepCoords = mapElement.dataset.visitedSteps
        ? JSON.parse(mapElement.dataset.visitedSteps)
        : []

      const notVisitedStepCoords = mapElement.dataset.notVisitedSteps
        ? JSON.parse(mapElement.dataset.notVisitedSteps)
        : []

      const stepsPlacesArray = mapElement.dataset.stepsPlaces
        ? JSON.parse(mapElement.dataset.stepsPlaces).map((stepPlace) => {
          return [
            stepPlace.lng,
            stepPlace.lat
          ]
        })
        : []

      // create a function to make a directions request

      map.on('load', () => {
        // CREATE ITINERARY
        displayPoint(navStartingCoords, '#3887be', 'start-point');
        if (navEndingCoords[1] && navEndingCoords[0]) {
          const places = JSON.parse(mapElement.dataset.places);
          // make an initial directions request that
          // starts and ends at the same location
          displayPoint(navEndingCoords, '#F5114B', 'end-point');
          getAndDisplayRoute(navStartingCoords, navEndingCoords, stepsPlacesArray);
          fitMapToMarkers(map, navMarkers);

          displayMarkers(places, 'grey');
          displayMarkers(visitedStepCoords, 'green');
          displayMarkers(notVisitedStepCoords, 'orange');
        }
      });
    });
  }
};

export { initMapbox };
