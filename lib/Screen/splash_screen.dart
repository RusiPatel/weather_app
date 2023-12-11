import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Utils/app_image.dart';

import '../Routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2),
        (){
      Get.toNamed(Routes.locationScreen);
        }
    );


    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Get.height/2.5,
          width: Get.width/1.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.BackgroundImage)
            )
          ),
        ),
      ),
    );
  }
}
