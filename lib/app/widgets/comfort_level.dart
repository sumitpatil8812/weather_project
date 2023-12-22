import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/app/data/weather_data_current_response.dart';
import 'package:weather_app/app/utils/app_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Center(
          child: SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: weatherDataCurrent.current.humidity!.toDouble(),
            appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                    handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                infoProperties: InfoProperties(
                    bottomLabelText: "Humidity",
                    bottomLabelStyle: const TextStyle(
                        letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                animationEnabled: true,
                size: 140,
                customColors: CustomSliderColors(
                    hideShadow: true,
                    trackColor: AppColors.firstGradientColor.withAlpha(100),
                    progressBarColors: [
                      AppColors.firstGradientColor,
                      AppColors.secondGradientColor
                    ])),
          ),
        )
      ],
    );
  }
}
