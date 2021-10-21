enum UnitsEnum {
  celsius,
  fahrenheit,
}

class Weather {
  final double temp;
  final String city;
  UnitsEnum units = UnitsEnum.celsius;
  Weather({
    required this.temp,
    required this.city,
  });

  setC() {
    units = UnitsEnum.celsius;
  }

  setF() {
    units = UnitsEnum.fahrenheit;
  }

  isCelsius() {
    if (units == UnitsEnum.celsius) return true;
    return false;
  }

  static Weather defaultWeather() {
    return Weather(
      temp: 0,
      city: 'Киев',
    );
  }

  double get temperature => (units == UnitsEnum.celsius)
      ? temp
      : double.parse((temp * 9 / 5 + 32).toStringAsFixed(2));
}
