import 'package:connect_app/app/modules/location/domain/repo/location_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends ChangeNotifier {
  /// encapsulation
  double _lat = 0;
  double _long = 0;

  double get lat => _lat;
  double get long => _long;

  set setLat(double newLat) {
    _lat = newLat;
  }

  set setLong(double newLongitude) {
    _long = newLongitude;
  }

  Future<void> checkLocationPermission() async {
    LocationPermission hasLocationPermission =
        await Geolocator.requestPermission();

    if (hasLocationPermission.name == LocationPermission.whileInUse.name ||
        hasLocationPermission.name == LocationPermission.always.name) {
      getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    _lat = position.latitude;
    _long = position.longitude;

    /// should i save them in shared Prefernces,
    /// i should save them where Firebase
    locationRepo.updateUserLocation(latitude: _lat, longitue: _long);
    notifyListeners();
  }
}
