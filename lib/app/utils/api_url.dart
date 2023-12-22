import 'package:weather_app/app/utils/api_key.dart';

class ApiEndPoints {
  static String apiURL(double lat, double lon) =>
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";
}
