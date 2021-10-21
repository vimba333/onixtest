import 'package:onixtest/import_model.dart';
import 'package:onixtest/api/service/openweathermap_service.dart';

class WeatherRepository {
  Future<Weather> getWeather(String cityName) async {
    try {
      Map<String, dynamic> data =
          await OpenweathermapService.currentWeatherByCity('Киев');

      return Weather(double.parse(data["main"]["temp"].toString()));
    } catch (e) {
      return Weather.defaultWeather();
    }
  }
}
