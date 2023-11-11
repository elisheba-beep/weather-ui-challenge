import 'package:flutter/material.dart';

class CurrentWeatherDetailTile extends StatelessWidget {
  const CurrentWeatherDetailTile({
    required this.icon,
    required this.text,
    required this.value,
    super.key,
  });
  final String text;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
