import 'package:onixtest/import_model.dart';
import 'package:onixtest/api/service/openweathermap_service.dart';

class WeatherRepository {
  Future<Weather> getWeather(String cityName) async {
    try {
      Map<String, dynamic> data =
          await OpenweathermapService.currentWeatherByCity(cityName);

      return Weather(
        temp: double.parse(data["main"]["temp"].toString()),
        city: cityName,
      );
    } catch (e) {
      return Weather.defaultWeather();
    }
  }
}
