import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});

  double latitude, longitude;

  Future getCurrentPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
