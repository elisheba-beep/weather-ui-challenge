import 'package:flutter/material.dart';
import 'package:weather/screens/saved_locations_screen.dart';
import 'package:weather/widgets/current_weather_details_row.dart';
import 'package:weather/widgets/daily_weather_container.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 200,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24.0, top: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'London',
                style: TextStyle(
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/london.png'), fit: BoxFit.cover),
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 125.0, left: 24.0, right: 24.0, bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nov 07',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Updated as of ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '07/11/2023 11:23 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Icon(
                  Icons.sunny,
                  color: Colors.orange,
                  size: 45,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Clear',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  '24°ᶜ',
                  style: TextStyle(color: Colors.white, fontSize: 86),
                ),
                SizedBox(
                  height: 62,
                ),
                CurrentWeatherDetailsRow(),
                SizedBox(
                  height: 28,
                ),
                DailyWeatherContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
