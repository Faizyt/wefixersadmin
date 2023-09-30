import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/services/appwrite/connection.dart';

class LoginController extends GetxController {
  var email = '';
  var password = '';
  var emailError = RxnString();
  var passwordError = RxnString();
  var isLoading = false.obs;
  TextEditingController apikey = TextEditingController();

  void setEmail(String value) {
    email = value;
    if (value.isEmail) {
      emailError.value = null;
    } else {
      emailError.value = 'Enter a valid email';
    }
  }

  void setPassword(String value) {
    password = value;
    if (value.length >= 6) {
      passwordError.value = null;
    } else {
      passwordError.value = 'Password must be at least 6 characters';
    }
  }

  Future login() async {
    GetStorage storage = GetStorage();
    AppWriteConnection appWriteConnection = AppWriteConnection();
    if (emailError.value == null && passwordError.value == null) {
      isLoading.value = true;
      try {
        final login = await appWriteConnection.account!.createEmailSession(
          email: email,
          password: password,
        );
        storage.write('login', login.current);
        storage.write('apikey', apikey.text);
        isLoading.value = false;
        Get.offAllNamed('/home');
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
      isLoading.value = false;
    } else {
      Get.snackbar('Error', 'FIll out the Field Correctly');
    }
  }
}
