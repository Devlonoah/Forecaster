import 'package:geolocator/geolocator.dart';

class LocationProvider {
  Future<Position> fetchLocation() async {
    bool _locationPermission = await Geolocator.isLocationServiceEnabled();

    if (_locationPermission) {
      Position position = await Geolocator.getCurrentPosition();

      return position;
    } else if (!_locationPermission) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();

        return position;
      }
    }
  }
}
