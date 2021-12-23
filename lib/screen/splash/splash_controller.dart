import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stream_nime/screen/home/home_screen.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    this.navigateHome();
    super.onInit();
  }

  navigateHome() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => HomeScreen());
    });
  }
}