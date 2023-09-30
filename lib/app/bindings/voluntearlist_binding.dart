
import 'package:get/get.dart';
import '../controllers/voluntearlist_controller.dart';


class VoluntearlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoluntearlistController>(() => VoluntearlistController());
  }
}