import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class HeaderWidget extends GetView<HomeController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            controller.city,
            style: const TextStyle(fontSize: 35, height: 2),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            controller.date,
            style:
                TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
          ),
        ),
      ],
    );
  }
}

// class HeaderWidget extends StatefulWidget {
//   const HeaderWidget({Key? key}) : super(key: key);

//   @override
//   State<HeaderWidget> createState() => _HeaderWidgetState();
// }

// class _HeaderWidgetState extends State<HeaderWidget> {


//   final HomeController globalController =
//       Get.put(HomeController(), permanent: true);

//   // @override
//   // void initState() {
//   //   getAddress(globalController.getLattitude().value,
//   //       globalController.getLongitude().value);
//   //   super.initState();
//   // }

//   // getAddress(lat, lon) async {
//   //   List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
//   //   Placemark place = placemark[0];
//   //   setState(() {
//   //     city = place.locality!;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
