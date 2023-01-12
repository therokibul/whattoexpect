import 'package:get/get.dart';

class FadeInAnimatController extends GetxController {
  static FadeInAnimatController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 5000));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    // Get.offAll(page)
  }
}
