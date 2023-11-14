import 'package:flutter/material.dart';
import 'package:weather/data/location_data.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/widgets/add_new_button.dart';
import 'package:weather/widgets/saved_location_container.dart';
import 'package:weather/widgets/search_row.dart';

class SavedLocationsScreen extends StatelessWidget {
  const SavedLocationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF391A49),
                Color(0xFF301D5C),
                Color(0xFF262171),
                Color(0xFF301D5C),
                Color(0xFF391A49),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.11, 0.32, 0.56, 0.69, 0.90],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 53.0,
          ),
          child: Column(
            children: [
              const SearchRow(),
              const SizedBox(
                height: 12,
              ),

              for (final data in locationData)
                SavedLocationContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherScreen(
                                  location: data.location,
                                )));
                  },
                  location: data.location,
                  weather: 'Clear',
                  humidity: '56%',
                  wind: '4.63km/h',
                  temp: '24',
                  icon: Icons.sunny,
                  color: Colors.orange,
                ),

              // SavedLocationContainer(
              //   onTap: () {},
              //   location: 'London',
              //   weather: 'Clouds',
              //   humidity: '65%',
              //   wind: '4.12km/h',
              //   temp: '16',
              //   icon: Icons.cloud,
              //   color: Colors.white,
              // ),
              // SavedLocationContainer(
              //   onTap: () {},
              //   location: 'New York',
              //   weather: 'Thunderstorm',
              //   humidity: '34%',
              //   wind: '9.26km/h',
              //   temp: '25',
              //   icon: Icons.cloudy_snowing,
              //   color: Colors.white,
              // ),
              const AddNewButton(),
            ],
          ),
        ),
      ),
    );
  }
}
