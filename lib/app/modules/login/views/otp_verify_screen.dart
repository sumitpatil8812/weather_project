import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';
import 'package:weather_app/app/utils/app_colors.dart';
import 'package:weather_app/app/utils/constants.dart';

class OtpVerifyView extends GetView<LoginController> {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.otpController.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Otp Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.otpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/weatherLogo.png",
                  scale: 5,
                ),
                addVerticalSpace(50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.otpController,
                  maxLength: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter OTP";
                    } else if (value.length != 6) {
                      return "Please enter valid OTP";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: "Enter Otp here",
                      prefixIcon: const Icon(Icons.lock_outline),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                addVerticalSpace(20),
                SizedBox(
                  height: Get.height * 0.06,
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor: MaterialStatePropertyAll(
                              AppColors.firstGradientColor)),
                      onPressed: () {
                        if (controller.otpFormKey.currentState?.validate() ??
                            false) {
                          controller.verifyOTP();
                        }
                      },
                      child: const Text(
                        "Submit",
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
