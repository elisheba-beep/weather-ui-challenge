import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:weather/data/location_data.dart';
import 'package:weather/data/weather_api.dart';
import 'package:weather/screens/saved_locations_screen.dart';
import 'package:weather/widgets/current_weather_details_row.dart';
import 'package:weather/widgets/daily_weather_container.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.location});

  final String location;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // late variables
  late String locationImage;
  late double locationLatitude;
  late double locationLongitude;

  // variables from the api
  dynamic weatherData;
  int temp = 32;
  double wind = 4.6;
  int humidity = 84;
  int feelsLike = 22;
  String weatherMain = 'Clear';
  String iconCode = '03d';

  // variables to check if data is gotten
  bool isLoading = false;
  bool errorOccured = false;

  // date
  final now = DateTime.now();

// get location data function
  Future getLocationData() async {
    for (final data in locationData) {
      if (data.location == widget.location) {
        locationImage = data.image;
        locationLatitude = data.lat;
        locationLongitude = data.lon;
      }
    }
    setState(() {
      isLoading = true;
      errorOccured = false;
    });

    // network helper to get weather
    NetworkHelper networkHelper =
        NetworkHelper(locationLatitude, locationLongitude);
    try {
      var weatherData = await networkHelper.getWeather();
      weatherData = weatherData;
      temp = ((weatherData['main']['temp']) - 273).ceil();
      humidity = weatherData['main']['humidity'];
      wind = weatherData['wind']['speed'];
      weatherMain = weatherData['weather'][0]['main'];
      iconCode = weatherData['weather'][0]['icon'];
      feelsLike = ((weatherData['main']['feels_like']) - 273).ceil();
    } catch (e) {
      setState(() {
        errorOccured = true;
        isLoading = false;
      });
      debugPrint(e.toString());
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

// init state
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 200,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                padding: const EdgeInsets.only(right: 24.0, top: 24.0),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 32,
                ));
          })
        ],
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xFF391A49),
        child: const SavedLocationsScreen(),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(locationImage), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 125.0, left: 24.0, right: 24.0, bottom: 24.0),
              // check if data is loaded
              child: isLoading
                  ? const Center(
                      child: SpinKitChasingDots(
                        color: Colors.white,
                        size: 70.0,
                      ),
                    )
                  : errorOccured
                      ? const Center(
                          child: Text('no data'),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (DateFormat('MMMd')).format(now),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Updated as of ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  DateFormat('d/M/y').add_jm().format(now),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Image(
                                image: NetworkImage(
                                    'https://openweathermap.org/img/wn/$iconCode@2x.png')),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              weatherMain,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            Text(
                              '$temp°ᶜ',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 86),
                            ),
                            const SizedBox(
                              height: 62,
                            ),
                            CurrentWeatherDetailsRow(
                              humidity: humidity,
                              wind: wind,
                              feelsLike: feelsLike,
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            const DailyWeatherContainer(),
                          ],
                        )),
        ),
      ),
    );
  }
}
