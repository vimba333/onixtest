import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_repository.dart';
import 'package:onixtest/logic/model/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;
  GetWeatherEvent(this.cityName);
}

class WeatherInitializationEvent extends WeatherEvent {}

class CelsiusEvent extends WeatherEvent {}

class FahrenheitEvent extends WeatherEvent {}

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
  WeatherBloc() : super(WeatherOk(Weather.defaultWeather()));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      yield WeatherLoaded();
      final weather = await _weatherRepository.getWeather(event.cityName);
      yield WeatherOk(weather);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('city', event.cityName);
    } else if (event is CelsiusEvent) {
    } else if (event is FahrenheitEvent) {
    } else if (event is WeatherInitializationEvent) {
      yield WeatherLoaded();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? city = prefs.getString('city');
      if (city != null) {
        final weather = await _weatherRepository.getWeather(city);
        yield WeatherOk(weather);
      } else {
        final defaultCity = Weather.defaultWeather().city;
        final weather = await _weatherRepository.getWeather(defaultCity);
        yield WeatherOk(weather);
      }
    }
  }
}
