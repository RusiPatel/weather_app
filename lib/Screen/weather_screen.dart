import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Utils/app_colors.dart';
import 'package:weather_app/Utils/app_image.dart';

import '../Controller/weather_screen_controller.dart';
import '../Utils/custom_text.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherScreenController weatherScreenController =
      Get.put(WeatherScreenController());

  @override
  void initState() {
    print("object");
    weatherScreenController.getWeatherOfCity(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.BackgroundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Obx(
            ()=> weatherScreenController
                .weatherModel.value.location == null ? Center(child: CircularProgressIndicator(),): ListView(
              children: [
                Container(
                  height: Get.height / 2.5,
                  decoration: BoxDecoration(
                      color: AppColors.transparentColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: Get.height / 20,
                              color: AppColors.whiteColor,
                            ),
                            SizedBox(
                              width: Get.width / 40,
                            ),
                            Obx(
                              () => CustomText(
                                text: weatherScreenController
                                    .weatherModel.value.location!.name!,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            CustomText(
                              text:
                                  DateFormat("hh : mm a").format(DateTime.now()),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              weatherScreenController
                                  .weatherModel.value.current!.weatherIcons![0],
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                CustomText(
                                  text:
                                      "${weatherScreenController.weatherModel.value.current!.temperature} °C",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: weatherScreenController.weatherModel.value
                                      .current!.weatherDescriptions![0],
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomText(
                          text: DateFormat("dd MMM, yyyy").format(DateTime.now()),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: Get.height / 2.5,
                  decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const CustomText(
                                text: "Humidity : ",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontColor: AppColors.whiteColor),
                            Obx(
                              () => CustomText(
                                text: weatherScreenController
                                    .weatherModel.value.current!.humidity!
                                    .toString(),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: "Wind speed : ",
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            Obx(
                              () => CustomText(
                                text: weatherScreenController
                                    .weatherModel.value.current!.windSpeed!
                                    .toString(),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: "UV Index : ",
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            Obx(
                              () => CustomText(
                                text: weatherScreenController
                                    .weatherModel.value.current!.uvIndex!
                                    .toString(),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
