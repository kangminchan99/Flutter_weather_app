import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      // 5.getMyCurrentLocation()안에서는 Geolocator패키지를 사용하여 위도와 경도값을 받아와
      // position에 저장하고 await을 사용하여 async방식으로 동작한다.
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
      print(position);
    } catch (e) {
      print('There was a problem with the internet connection.');
    }
  }
}
