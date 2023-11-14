// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/data/location_data.dart';
import 'package:weather/data/weather_api.dart';
import 'package:weather/screens/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final String locationImage;
  late final double locationLatitude;
  late final double locationLongitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    locationImage = locationData[0].image;
    locationLatitude = locationData[0].lat;
    locationLongitude = locationData[0].lon;
    NetworkHelper networkHelper =
        NetworkHelper(locationLatitude, locationLongitude);
    var weatherData = await networkHelper.getWeather();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WeatherScreen(location: locationData[0].location)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
