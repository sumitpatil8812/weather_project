import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/weather_data_current_response.dart';
import 'package:weather_app/app/utils/app_colors.dart';
import 'package:weather_app/app/utils/constants.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/${weatherDataCurrent.current.weather![0].icon}.png",
              width: Get.width * 0.25,
            ),
            Container(
              height: Get.width * 0.15,
              width: 1,
              color: AppColors.dividerLine,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${weatherDataCurrent.current.temp!.toInt()}°",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 68,
                      color: AppColors.textColorBlack,
                    )),
                TextSpan(
                    text:
                        "${weatherDataCurrent.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ]),
            )
          ],
        ),

        addVerticalSpace(20),
        // more details - windspeed, humidity, clouds
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.18,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/windspeed.png"),
                ),
                addVerticalSpace(10),
                Text(
                  "${weatherDataCurrent.current.windSpeed}km/h",
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.18,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/clouds.png"),
                ),
                addVerticalSpace(10),
                Text(
                  "${weatherDataCurrent.current.clouds}%",
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.18,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/humidity.png"),
                ),
                addVerticalSpace(10),
                Text(
                  "${weatherDataCurrent.current.humidity}%",
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
