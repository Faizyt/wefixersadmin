import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wefixersadmin/app/data/provider/accountauth.dart';

class MainhomeController extends GetxController {
  logout() async {
    AccountAuth accountAuth = AccountAuth();
    final logout = await accountAuth.logout();
    
    GetStorage storage = GetStorage();
    storage.remove('login');
    storage.remove('apikey');
    Get.offAllNamed('/login');
  }
}
