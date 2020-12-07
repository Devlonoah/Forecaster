import 'package:geolocator/geolocator.dart';

class LocationProvider {
  Future<Position> fetchLocation() async {
    try {
      bool _locationPermission = await Geolocator.isLocationServiceEnabled();

      if (_locationPermission) {
        Position position = await Geolocator.getCurrentPosition();

        return position;
      } else if (!_locationPermission) {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          Position position = await Geolocator.getCurrentPosition();

          return position;
        }
      }
    } catch (e) {
      print('location provider error: $e');
    }
  }
}
