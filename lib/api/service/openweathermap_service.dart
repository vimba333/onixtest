import 'package:http/http.dart' as http;
import 'dart:convert';

/// api doc    https://openweathermap.org/current
class OpenweathermapService {
  static Future<Map<String, dynamic>> currentWeatherByCity(String city) async {
    final response = await http.post(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=5e242e38ae5c1dd42c66d4a24a89a02a'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather from openweathermap');
    }
  }
}
