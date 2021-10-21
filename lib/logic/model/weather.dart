class Weather {
  final double temp;
  final String city;
  Weather({required this.temp, required this.city});

  static Weather defaultWeather() {
    return Weather(
      temp: 0,
      city: 'Kropyvnytskyi',
    );
  }
}
