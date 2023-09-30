import 'package:get/get.dart';

import '../data/provider/appwriteservices.dart';

class VoluntearlistController extends GetxController {
  AppwriteServices appwriteServices = AppwriteServices();
  RxInt list = 0.obs;
  RxList data = [].obs;

  Future listofVoluntears() async {
    final result = await appwriteServices.listVoluntears();
    list.value = result.documents.length;
    data.value = result.documents;
    return result;
  }
}
