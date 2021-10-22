import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_repository.dart';
import 'package:onixtest/logic/model/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherEvent {}

class WeatherInitializationEvent extends WeatherEvent {}

class CelsiusEvent extends WeatherEvent {}

class FahrenheitEvent extends WeatherEvent {}

class GetByCityWeatherEvent extends WeatherEvent {
  final String cityName;
  GetByCityWeatherEvent(this.cityName);
}

class WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded();
}

class WeatherOk extends WeatherState {
  final Weather weather;
  WeatherOk(this.weather);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  Weather? currentWeather;
  WeatherBloc() : super(WeatherOk(Weather.defaultWeather()));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetByCityWeatherEvent) {
      yield WeatherLoaded();
      final weather = await _weatherRepository.getWeather(event.cityName);
      currentWeather = weather;
      yield WeatherOk(weather);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('city', event.cityName);
      currentWeather = weather;
    } else if (event is CelsiusEvent) {
      currentWeather!.setC();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('units', 'c');
      yield WeatherOk(currentWeather!);
    } else if (event is FahrenheitEvent) {
      if (currentWeather == null) return;
      currentWeather!.setF();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('units', 'f');
      yield WeatherOk(currentWeather!);
    } else if (event is WeatherInitializationEvent) {
      yield WeatherLoaded();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? city = prefs.getString('city');
      String? units = prefs.getString('units');
      Weather weather;
      if (city != null) {
        weather = await _weatherRepository.getWeather(city);
      } else {
        final defaultCity = Weather.defaultWeather().city;
        weather = await _weatherRepository.getWeather(defaultCity);
      }
      if (units != null && units == 'f') {
        weather.setF();
      }
      yield WeatherOk(weather);
      currentWeather = weather;
    }
  }
}
