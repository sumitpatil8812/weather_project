import 'package:weather_app/app/data/weather_data_current_response.dart';
import 'package:weather_app/app/data/weather_data_daily_response.dart';
import 'package:weather_app/app/data/weather_data_hourly_response.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  // function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
