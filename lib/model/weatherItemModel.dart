class WeatherItemModel {
  String cityName;
  double coord;
  double temp;
  String description;
  double windSpeed;
  // var humidity;

  String country;

  WeatherItemModel({
    this.cityName,
    this.coord,
    this.temp,
    this.description,
    this.windSpeed,
    // this.humidity,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'country': coord,
      'temp': temp,
      'description': description,
      'windSpeed': windSpeed,
      // 'humidity': humidity,
      'country': country,
    };
  }

  factory WeatherItemModel.fromMap(dynamic map) {
    if (map == null) return null;

    return WeatherItemModel(
      coord: map["coord"]["lon"],
      temp: map['main']['temp'],
      description: map['weather'][0]['description'],
      cityName: map['name'],
      country: map['sys']['country'],
      windSpeed: map['wind']['speed'],
    );
  }
}
