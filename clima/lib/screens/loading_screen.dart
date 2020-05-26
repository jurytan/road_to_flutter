import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/secret.dart';
import 'package:clima/services/secret_loader.dart';
import 'package:clima/utilities/constants.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String getUnitSystem() {
    return kUnitSystem == Unit.IMPERIAL ? 'imperial' : 'metric';
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();
    print('Lat: ${location.latitude}, Long: ${location.longitude}');

    Secret secret = await SecretLoader(secretPath: 'secrets.json').load();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${secret.owmApiKey}&units=${getUnitSystem()}');

    var weatherData = await networkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
