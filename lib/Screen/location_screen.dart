import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Routes/routes.dart';
import 'package:weather_app/Utils/app_colors.dart';
import 'package:weather_app/Utils/app_image.dart';
import 'package:weather_app/Utils/custom_snackbar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: Get.height / 2.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.BackgroundImage))),
          ),
          SizedBox(
            height: Get.height / 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(hintText: "Enter City."),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          InkWell(
            onTap: () {
              if(textEditingController.text.isEmpty){
                SnackBars.errorSnackBar(content: "Please entre city name");
                return;
              }
              Get.toNamed(Routes.weatherScreen,
                  arguments: textEditingController.text);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.blueAccentColor),
              child: Center(
                  child: Text(
                "Weather",
                style: TextStyle(
                    fontSize: Get.height / 20, color: AppColors.whiteColor),
              )),
            ),
          )
        ],
      ),
    );
  }
}
