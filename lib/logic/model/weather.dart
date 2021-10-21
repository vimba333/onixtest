enum UnitsEnum {
  celsius,
  fahrenheit,
}

class Weather {
  final double temp;
  final String city;
  final UnitsEnum units;
  Weather({
    required this.temp,
    required this.city,
    this.units = UnitsEnum.celsius,
  });

  static Weather defaultWeather() {
    return Weather(
      temp: 0,
      city: 'Paris',
    );
  }

  double get temperature =>
      (units == UnitsEnum.celsius) ? temp : (temp * 9 / 5 + 32);
}
