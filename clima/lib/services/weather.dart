import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/secret.dart';
import 'package:clima/services/secret_loader.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Secret secret = await SecretLoader(secretPath: 'secrets.json').load();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityName&appid=${secret.owmApiKey}&units=${getUnitSystem()}');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    print('Lat: ${location.latitude}, Long: ${location.longitude}');

    Secret secret = await SecretLoader(secretPath: 'secrets.json').load();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=${secret.owmApiKey}&units=${getUnitSystem()}');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getUnitSystem() {
    return kUnitSystem == Unit.IMPERIAL ? 'imperial' : 'metric';
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > kHiTemp) {
      return 'It\'s 🍦 time';
    } else if (temp > kMidTemp) {
      return 'Time for shorts and 👕';
    } else if (temp < kLowTemp) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
