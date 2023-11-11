import 'package:flutter/material.dart';

class DailyWeatherTile extends StatelessWidget {
  const DailyWeatherTile({
    required this.date,
    required this.icon,
    required this.temp,
    required this.wind,
    required this.color,
    super.key,
  });
  final String date;
  final IconData icon;
  final String temp;
  final String wind;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Color(
              0xFFECECEC,
            ),
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Icon(
          icon,
          size: 32,
          color: color,
        ),
        Text(
          temp,
          style: const TextStyle(
            color: Color(
              0xFFECECEC,
            ),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          wind,
          style: const TextStyle(
            color: Color(
              0xFFECECEC,
            ),
            fontSize: 10,
          ),
        ),
        const Text(
          'km/h',
          style: TextStyle(
            color: Color(
              0xFFECECEC,
            ),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
