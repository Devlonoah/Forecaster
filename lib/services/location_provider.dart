import 'package:geolocator/geolocator.dart';

class LocationProvider {
  Future<Position> fetchLocation() async {
    Position positionData;

    bool _locationPermission = await Geolocator.isLocationServiceEnabled();

    if (_locationPermission) {
      Position position = await Geolocator.getCurrentPosition();

      return position;
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        positionData = position;
        return position;
      }
    }

    return positionData;
  }
}
