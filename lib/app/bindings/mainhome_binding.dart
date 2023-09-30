
import 'package:get/get.dart';
import '../controllers/mainhome_controller.dart';


class MainhomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainhomeController>(() => MainhomeController());
  }
}