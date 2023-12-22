import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/utils/app_colors.dart';
import 'package:weather_app/app/utils/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.logingFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/weatherLogo.png",
                  scale: 5,
                ),
                addVerticalSpace(50),
                TextFormField(
                  controller: controller.phoneController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    } else if (value.length != 10) {
                      return "Please enter valid Phone number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    hintText: "Enter Mobile Number",
                    prefixIcon: const Icon(Icons.call),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                addVerticalSpace(20),
                Obx(
                  () => SizedBox(
                    height: Get.height * 0.06,
                    width: Get.width * 0.9,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.firstGradientColor)),
                        onPressed: () {
                          if (controller.logingFormKey.currentState
                                  ?.validate() ??
                              false) {
                            controller.loader.value = true;
                            controller.verifyPhoneNumber();
                          }
                        },
                        child: controller.loader.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Send Otp",
                              )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
