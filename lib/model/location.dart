class Location {
  double longitude;
  double latitude;
  Location({
    this.longitude,
    this.latitude,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Location && o.longitude == longitude && o.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}
