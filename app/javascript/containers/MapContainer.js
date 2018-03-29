import React from 'react';
import ReactMapboxGl, { Layer, Feature } from 'react-mapbox-gl';


const Map = ReactMapboxGl({
  accessToken: "pk.eyJ1IjoicmFoYXluZXM4MCIsImEiOiJjamZjb3k5bDExdm91NGFxaGJjaDhwcnEwIn0.d-dxgfRiiGePPuS99dHBPg"
});

class MapContainer extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {

    return(
      <div>
        <h6>Use the map below to find food trucks</h6>
        <Map
          center={[-75.163685, 39.952345]}
          zoom={[12]}
          style="mapbox://styles/mapbox/streets-v9"
          containerStyle={{
            height: "400px",
            width: "75%"
          }}>
          <Layer
            type="symbol"
            id="marker"
            layout={{ "icon-image": "marker-15" }}>
          </Layer>
        </Map>
      </div>
    )
  }
}
export default MapContainer;
