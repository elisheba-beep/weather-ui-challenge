// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.lat, this.lon);
  final double lat;
  final double lon;

  final String _APIkey = '1a835d389c261a317cd101ba80bbf32a';

  Future getWeather() async {
    try {
      final uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_APIkey');
      print(uri);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
