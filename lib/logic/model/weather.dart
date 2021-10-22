enum UnitsEnum {
  celsius,
  fahrenheit,
}

class Weather {
  final String iconCode;
  final double temp;
  final String city;
  final double humidity;
  UnitsEnum units = UnitsEnum.celsius;
  Weather({
    required this.temp,
    required this.city,
    required this.iconCode,
    required this.humidity,
  });

  String get tempFormat =>
      ((units == UnitsEnum.celsius)
          ? ((temp).toStringAsFixed(0)).toString()
          : ((temp * 9 / 5 + 32).toStringAsFixed(0)).toString()) +
      ((isCelsius()) ? "℃" : "℉");

  String get humidityFormat => humidity.toString() + "%";

  String get unitsFormat => (isCelsius()) ? "℃" : "℉";

  setUnitsCelsius() {
    units = UnitsEnum.celsius;
  }

  setUnitsFahrenheit() {
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
      iconCode: '01d',
      humidity: 50,
    );
  }
}
