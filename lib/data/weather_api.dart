import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/api_key.dart';

class NetworkHelper {
  NetworkHelper(this.lat, this.lon);
  final double lat;
  final double lon;

  Future getWeather() async {
    try {
      final uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$APIkey');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
