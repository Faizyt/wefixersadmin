import 'package:get/get_navigation/get_navigation.dart';
import 'package:wefixersadmin/app/bindings/login_binding.dart';
import 'package:wefixersadmin/app/bindings/mainhome_binding.dart';
import 'package:wefixersadmin/app/bindings/voluntearlist_binding.dart';
import 'package:wefixersadmin/app/bindings/voluntearregistration_binding.dart';
import 'package:wefixersadmin/app/ui/pages/mainhome_page/mainhome_page.dart';
import 'package:wefixersadmin/app/ui/pages/voluntearlist_page/voluntearlist_page.dart';
import 'package:wefixersadmin/app/ui/pages/voluntearregistration_page/voluntearregistration_page.dart';

import '../ui/pages/login_page/login_page.dart';

class Pages {
  static const String home = '/home';
  static const String login = '/login';
  static const String voluntearRegister = '/voluntearregister';
  static const String voluntearList = '/voluntearlist';
  static var pages = [
    GetPage(
        name: home,
        page: () => const MainhomePage(),
        binding: MainhomeBinding()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: voluntearRegister,
        page: () => const VoluntearregistrationPage(),
        binding: VoluntearregistrationBinding()),
    GetPage(
        name: voluntearList,
        page: () => const VoluntearlistPage(),
        binding: VoluntearlistBinding())
  ];
}
