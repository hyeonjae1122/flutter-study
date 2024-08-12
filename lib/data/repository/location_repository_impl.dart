import 'package:flutter_study/data/model/location.dart';
import 'package:flutter_study/data/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  double distanceBetween(double startLat, double startLng, double endLat, double endLng)  {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);

  }

  @override
  Future<Location> getLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(serviceEnabled){
      var permission =await Geolocator.checkPermission();

      if(permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return const Location(latitude: 0, longitude: 0);
      } else if (permission == LocationPermission.deniedForever) {
        return const Location(latitude: 0, longitude: 0);
      }

      //approval
      final position = await Geolocator.getCurrentPosition();
      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    }
    final position = await Geolocator.getCurrentPosition();
    return Location(latitude: 0, longitude: 0);

  }
  
}