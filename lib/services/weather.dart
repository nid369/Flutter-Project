import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '699a52f7dcc4bd1ba874125dd8e62959';
 double longitude;
    double latitude;

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    
        NetworkHelper networkHelper = NetworkHelper
      ('$openWeatherMapUrl?q=$cityName&appid=$apiKey');
    
        var weatherData = await networkHelper.getData();  
        return weatherData;  
      }

 Future<dynamic> getLocationWeather() async{
       Location location = Location();
       await location.getLocation();

       latitude = location.latitude;
       longitude = location.longitude;
      
      NetworkHelper networkHelper = NetworkHelper
      ('$openWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    
        var weather = await networkHelper.getData();  
        return weather;  
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
