import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/widgets/current_weather_detail_tile.dart';

class CurrentWeatherDetailsRow extends StatelessWidget {
  const CurrentWeatherDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrentWeatherDetailTile(
          icon: Icons.water_drop_outlined,
          text: 'HUMIDITY',
          value: '56%',
        ),
        CurrentWeatherDetailTile(
          icon: CupertinoIcons.wind,
          text: 'WIND',
          value: '4.63km/h',
        ),
        CurrentWeatherDetailTile(
          icon: Icons.thermostat,
          text: 'FEELS LIKE',
          value: '22°',
        ),
      ],
    );
  }
}
