class LocationData {
  double lat;
  double lon;
  String location;
  String image;

  LocationData(this.lat, this.lon, this.location, this.image);
}

List<LocationData> locationData = [
  LocationData(40.71, -74.01, 'New York', 'assets/images/newyork.png'),
  LocationData(48.86, 2.35, 'Paris', 'assets/images/paris.png'),
];
