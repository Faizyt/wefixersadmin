import 'package:dart_appwrite/dart_appwrite.dart' as server;
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wefixersadmin/app/data/services/appwrite/const/const.dart';

class Connection {
  server.Client client = server.Client();
  server.Account? account;
  GetStorage storage = GetStorage();
  Connection() {
    try {
      client
          .setEndpoint(AppwriteConst.endpointIP)
          .setProject(AppwriteConst.projectID)
          .setKey(storage.read('apikey'));
      account = server.Account(client);
      print("Connection Success");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}

class AppWriteConnection {
  Client client = Client();
  Account? account;
  AppWriteConnection() {
    try {
      client
          .setEndpoint(AppwriteConst.endpointIP)
          .setProject(AppwriteConst.projectID)
          .setSelfSigned(status: true);
      account = Account(client);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
