// import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationServices {
  final location = Location();

  Future<LocationData> getPosition() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // await SystemNavigator.pop();
        return Future.error('Location services are disabled.');
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      // await SystemNavigator.pop();
      return Future.error('denied');
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // await SystemNavigator.pop();
        return Future.error('denied forever');
      }
    }
    return await location.getLocation();
  }
}