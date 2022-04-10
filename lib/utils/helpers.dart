
import 'package:PLF/ColorScheme.dart';
import 'package:get/get.dart';


successToast(String title, String msg) {
  Get.snackbar(
    title, msg,
    backgroundColor: darkBlue,
    colorText: white,
    snackPosition: SnackPosition.BOTTOM,
  );
}

errorToast(String title, String msg) {
  Get.snackbar(
    title, msg,
    backgroundColor: red,
    colorText: white,
    snackPosition: SnackPosition.BOTTOM,
  );
}
