import 'package:flutter/material.dart';
import 'package:weather/widgets/daily_weather_tile.dart';

class DailyWeatherContainer extends StatelessWidget {
  const DailyWeatherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF535353).withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            24.0,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DailyWeatherTile(
              date: 'Wed 16',
              icon: Icons.cloud,
              temp: '22°',
              wind: '1-5',
              color: Color(
                0xFFECECEC,
              ),
            ),
            DailyWeatherTile(
              date: 'Thu 17',
              icon: Icons.sunny,
              temp: '25°',
              wind: '1-5',
              color: Colors.orange,
            ),
            DailyWeatherTile(
              date: 'Fri 18',
              icon: Icons.sunny,
              temp: '23°',
              wind: '5-10',
              color: Colors.orange,
            ),
            DailyWeatherTile(
              date: 'Sat 19',
              icon: Icons.cloud,
              temp: '25°',
              wind: '1-5',
              color: Color(
                0xFFECECEC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
