import 'package:flutter/material.dart';

class SavedLocationContainer extends StatelessWidget {
  const SavedLocationContainer({
    required this.location,
    required this.weather,
    required this.humidity,
    required this.wind,
    required this.temp,
    required this.icon,
    required this.color,
    required this.onTap,
    super.key,
  });

  final String location;
  final String weather;
  final String humidity;
  final String wind;
  final String temp;
  final IconData icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF535353).withOpacity(0.6),
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      weather,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Humidity ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          humidity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Wind ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          wind,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 32,
                    ),
                    Text(
                      '$temp°ᶜ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
