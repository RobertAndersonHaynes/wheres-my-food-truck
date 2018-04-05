import React, { Component } from 'react';
import ReactMapboxGl, { Layer, Feature, Popup } from 'react-mapbox-gl';
import Geocode from "react-geocode";
import FeatureTile from '../components/FeatureTile';
import update from 'immutability-helper';

const Map = ReactMapboxGl({
  accessToken: "pk.eyJ1IjoicmFoYXluZXM4MCIsImEiOiJjamZjb3k5bDExdm91NGFxaGJjaDhwcnEwIn0.d-dxgfRiiGePPuS99dHBPg"
});

// const StyledPopup = styled.div`
//   background: white;
//   color: #3f618c;
//   font-weight: 400;
//   padding: 5px;
//   border-radius: 2px;
// `;

class MapContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: [],
      coordinates: [],
      properties: {
        "marker-color": "#7e0a2d",
        "marker-size": "medium",
        "marker-symbol": "restaurant"
      },
      center: []
    };
    this.getUsers = this.getUsers.bind(this);
    this.getCoordinates = this.getCoordinates.bind(this)
    this.markerClick = this.markerClick.bind(this)
  }

  getUsers() {
    fetch('api/v1/users.json')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ users: body.users });
    })
    .then(body => {
      this.getCoordinates();
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  getCoordinates() {
    let users = Object.assign([], this.state.users)

    users.forEach((user, i) => {
      if (user.location != "") {
        fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${user.location}_${user.city}.json?&access_token=pk.eyJ1IjoicmFoYXluZXM4MCIsImEiOiJjamZjb3k5bDExdm91NGFxaGJjaDhwcnEwIn0.d-dxgfRiiGePPuS99dHBPg`)
        .then(response => {
          if (response.ok) {
            return response;
          } else {
            let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
            throw(error);
          }
        })
        .then(response => response.json())
        .then(body => {
          this.setState({
            users: update(this.state.users, {[i]: {coordinates: {$set: [body.features[0].geometry.coordinates[0], body.features[0].geometry.coordinates[1]]}}})
          })

        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
      }
    })
  }

  componentWillMount() {
    this.getUsers();
  }

  componentDidMount() {
  }

  onToggleHover(cursor: string, { map }: { map: any }) {
    map.getCanvas().style.cursor = cursor;
  }

  markerClick = (user: users, { feature }: { feature: any }) => {
    this.setState({
      center: [user.coordinates[0], user.coordinates[1]],
      zoom: [10],
      user
    });
  };
//
// handleMarkerClick(e){
//      let center = [e.feature.properties.lng, e.feature.properties.lat]
//      this.props.movies.map( movie => {
//        if (movie.id == e.feature.properties.movieId){
//          this.setState({selectedMovie: movie, center: center})
//        }
//      })
//    }



render() {
  let featureArray = []
  featureArray = this.state.users.map(user => {
    if (user.location != "") {
      return(
        <Feature
          key={user.id}
          properties={this.state.properties}
          onMouseEnter={this.onToggleHover.bind(this, 'pointer')}
          onMouseLeave={this.onToggleHover.bind(this, '')}
          // onClick={this.markerClick.bind(this, user[user.id])}
          coordinates={user.coordinates}
          ></Feature>
        )
      }
    }).filter(x => x)

    return(
      <div>
        <h6>Use the map below to find food trucks</h6>
        <Map
          center={[-75.163608, 39.952430]}
          zoom={[13]}
          style="mapbox://styles/rahaynes80/cjfk1xk5m5d642rpdlj48gmkt"
          containerStyle={{
            height: "500px",
            width: "100%"
          }}>
          <Layer
            type="symbol"
            id="marker"
            layout={{ "icon-image": "restaurant-15", "icon-size": 2 }}>

            {featureArray}
            {/* <Feature
              coordinates={[-75.157751, 39.961816]}
              ></Feature> */}
            </Layer>
          </Map>
        </div>
      )
    }
  }
  export default MapContainer;
