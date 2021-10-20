import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onixtest/import_repository.dart';
import 'package:onixtest/logic/model/weather.dart';

class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;
  GetWeatherEvent(this.cityName);
}

class WeatherState {
  final Weather weather;
  WeatherState(this.weather);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherState(Weather.defaultWeather()));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      final weather = await _weatherRepository.getWeather(event.cityName);
      yield WeatherState(weather);
    }
  }
}
