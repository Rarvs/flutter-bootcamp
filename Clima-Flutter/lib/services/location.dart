import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location({double latitude, double longitude}) {
    _longitude = longitude;
    _latitude = latitude;
  }

  double _latitude;
  double _longitude;
  Position _position;

  Future<void> getCurrentLocation() async {
    try {
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _latitude = _position.latitude;
      _longitude = _position.longitude;
    } catch (exception) {
      debugPrint(exception);
    }
  }

  Position getPosition() {
    return _position;
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
