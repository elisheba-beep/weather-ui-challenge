import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/widgets/current_weather_detail_tile.dart';

class CurrentWeatherDetailsRow extends StatelessWidget {
  const CurrentWeatherDetailsRow({
    required this.wind,
    required this.humidity,
    required this.feelsLike,
    super.key,
  });
  final double wind;
  final int humidity;
  final int feelsLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrentWeatherDetailTile(
          icon: Icons.water_drop_outlined,
          text: 'HUMIDITY',
          value: '$humidity%',
        ),
        CurrentWeatherDetailTile(
          icon: CupertinoIcons.wind,
          text: 'WIND',
          value: '$wind km/h',
        ),
        CurrentWeatherDetailTile(
          icon: Icons.thermostat,
          text: 'FEELS LIKE',
          value: '$feelsLike°',
        ),
      ],
    );
  }
}
