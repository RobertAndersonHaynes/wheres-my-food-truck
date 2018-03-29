import MapContainer from '../../../app/javascript/containers/MapContainer';
import ReactMapboxGl, { Layer, Feature } from 'react-mapbox-gl';

describe('MapContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<MapContainer />)
  })

  it('should display an h6', () => {
    expect(wrapper.find('h6')).toBePresent();
  })

  it('should display an div', () => {
    expect(wrapper.find("ReactMapboxGl")).toBePresent();
  })
})
