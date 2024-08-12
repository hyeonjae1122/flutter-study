import 'package:flutter_study/data/model/location.dart';
import 'package:flutter_study/data/repository/location_repository.dart';

class MockLocationRepository implements LocationRepository {
  @override
  double distanceBetween(double startLat, double startLng, double endLat, double endLng) {
    return 0;
  }

  @override
  Future<Location> getLocation() async {
    return const Location(latitude: 0, longitude: 0);
  }

}