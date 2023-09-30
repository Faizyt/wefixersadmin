
import 'package:get/get.dart';
import '../controllers/voluntearregistration_controller.dart';


class VoluntearregistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoluntearregistrationController>(() => VoluntearregistrationController());
  }
}