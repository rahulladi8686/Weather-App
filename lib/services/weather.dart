import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '1c2a0a24fe1ea3284b5dbd539524d99e';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getWeatheroOfCity(String cityName) async {
    String s =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url.toString());
    var networkData = await networkHelper.getData();
    return networkData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl' +
        'lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var networkData = await networkHelper.getData();
    return networkData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
