import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';

class HeaderWidget extends GetView<HomeController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
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
                style: TextStyle(
                    fontSize: 14, color: Colors.grey[700], height: 1.5),
              ),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: () {
            Get.dialog(AlertDialog(
              title: const Text(
                "Are you sure you want to logout?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("No")),
                TextButton(
                    onPressed: () {
                      Get.isRegistered<LoginController>()
                          ? Get.find<LoginController>().logout()
                          : Get.put(LoginController()).logout();
                    },
                    child: const Text("Yes")),
              ],
            ));
          },
          icon: const Icon(Icons.logout_outlined),
          label: const Text("Log out"),
          style: const ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.red),
            foregroundColor: MaterialStatePropertyAll(Colors.red),
          ),
        )
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
