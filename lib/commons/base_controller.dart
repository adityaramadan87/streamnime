import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  bool isLoading = false;

  BaseController();

  void showLoading(bool isLoading) {
    this.isLoading = isLoading;
    update();
  }

  void dispose();
}
