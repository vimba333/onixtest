class Weather {
  final double temp;
  Weather(this.temp);

  static Weather defaultWeather() {
    return Weather(3);
  }
}
