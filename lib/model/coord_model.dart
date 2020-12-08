class Coord {
  Coord({
    this.lon = 0.0,
    this.lat = 0.0,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
