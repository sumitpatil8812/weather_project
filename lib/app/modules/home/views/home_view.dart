import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/utils/app_colors.dart';
import 'package:weather_app/app/utils/constants.dart';
import 'package:weather_app/app/widgets/comfort_level.dart';
import 'package:weather_app/app/widgets/current_weather_widget.dart';
import 'package:weather_app/app/widgets/daily_data_forecast.dart';
import 'package:weather_app/app/widgets/header_widget.dart';
import 'package:weather_app/app/widgets/hourly_data_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => controller.checkLoading().isTrue
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: height(context) * 0.08,
                  ),
                  const CircularProgressIndicator()
                ],
              ))
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  addVerticalSpace(20),
                  const HeaderWidget(),
                  // for our current temp ('current')
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        controller.weatherData.value.getCurrentWeather(),
                  ),
                  addVerticalSpace(20),

                  HourlyDataWidget(
                      weatherDataHourly:
                          controller.weatherData.value.getHourlyWeather()),
                  DailyDataForecast(
                    weatherDataDaily:
                        controller.weatherData.value.getDailyWeather(),
                  ),
                  const Divider(),

                  ComfortLevel(
                      weatherDataCurrent:
                          controller.weatherData.value.getCurrentWeather())
                ],
              )),
      ),
    );
  }
}
