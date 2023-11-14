
import 'dart:convert';
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
