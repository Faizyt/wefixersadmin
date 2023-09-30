import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/appwrite/connection.dart';

class AccountAuth {
  final AppWriteConnection _appwrite = AppWriteConnection();
  GetStorage storage = GetStorage();
  Future login(String email, String password) async {
    try {
      final session =  await _appwrite.account?.createEmailSession(
        email: email,
        password: password,
      );
      storage.write('login', session);
      return session?.current;
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      return false;
    }
  }

  Future logout() async {
    try {
      await _appwrite.account?.deleteSession(sessionId: 'current');
      storage.remove('login');
    } catch (e) {
      Get.snackbar("Logout Failed", e.toString());
      return false;
    }
  }

  Future register(String email, String password, String name) async {
    try {
      final result = await _appwrite.account?.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return result?.$id;
    } catch (e) {
      Get.snackbar("Register Failed", e.toString());
      return false;
    }
  }
}