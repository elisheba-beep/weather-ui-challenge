class LocationData {
  double lat;
  double lon;
  String location;
  String image;

  LocationData(this.lat, this.lon, this.location, this.image);
}

List<LocationData> locationData = [
  LocationData(13.75, 100.50, 'Bangkok', 'assets/images/bangkok.png'),
  LocationData(41.38, 2.16, 'Barcelona', 'assets/images/barcelona.png'),
  LocationData(39.90, 116.40, 'Beijing', 'assets/images/beijing.png'),
  LocationData(25.20, 55.27, 'Dubai', 'assets/images/dubai.png'),
  LocationData(51.50, 0.12, 'London', 'assets/images/london.png'),
  LocationData(53.90, 27.55, 'Minsk', 'assets/images/minsk.png'),
  LocationData(40.71, -74.01, 'New York', 'assets/images/newyork.png'),
  LocationData(48.86, 2.35, 'Paris', 'assets/images/paris.png'),
  LocationData(41.90, 12.49, 'Rome', 'assets/images/rome.png'),
];
