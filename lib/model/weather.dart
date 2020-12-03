import 'dart:convert';

class WeatherItemModel {
  String cityName;
  String country;

  double temp;
  String description;
  double windSpeed;
  double humidity;

  WeatherItemModel({
    this.cityName,
    this.country,
    this.temp,
    this.description,
    this.windSpeed,
    this.humidity,
  });

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'country': country,
      'temp': temp,
      'description': description,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }

  factory WeatherItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    print(map['weather'].length);
    return WeatherItemModel(
      cityName: map['cityName'],
      country: map['country'],
      temp: map['temp'],
      description: map['description'],
      windSpeed: map['windSpeed'],
      humidity: map['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherItemModel.fromJson(String source) =>
      WeatherItemModel.fromMap(json.decode(source));
}
