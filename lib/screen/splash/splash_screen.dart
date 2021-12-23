import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/screen/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => Scaffold(
        appBar: null,
        backgroundColor: primary,
        body: Center(
          child: Text("FCK"),
        ),
      ),
    );
  }
}
