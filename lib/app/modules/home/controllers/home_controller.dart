import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/utils/api_services.dart';
import 'package:weather_app/app/data/weather_data_current_response.dart';
import 'package:weather_app/app/data/weather_data_daily_response.dart';
import 'package:weather_app/app/data/weather_data_repsonse.dart';
import 'package:weather_app/app/utils/api_url.dart';

import '../../../data/weather_data_hourly_response.dart';

class HomeController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble lattitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt currentIndex = 0.obs;
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  // instance for them to be called
  RxBool checkLoading() => _isLoading;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      // getIndex();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future fetchWeatherData({required double lat, required double lon}) async {
    ApiService().get(
        endpoint: ApiEndPoints.apiURL(lat, lon),
        onSuccess: (model) {
          // if (model is WeatherData) {
          // weatherData.value = model as WeatherData;
          weatherData.value = WeatherData(
              WeatherDataCurrent.fromJson(model),
              WeatherDataHourly.fromJson(model),
              WeatherDataDaily.fromJson(model));
          _isLoading.value = false;
          // }
        },
        onError: (error) {
          _isLoading.value = false;
        });
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      lattitude.value = value.latitude;
      longitude.value = value.longitude;
      // calling our weather api
      getAddress(value.latitude, value.longitude);

      return fetchWeatherData(lat: value.latitude, lon: value.longitude);

      //     .then((value) {
      //   weatherData.value = value;
      //   _isLoading.value = false;
      // });
    });
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    city = place.locality!;
    update();
  }
}
