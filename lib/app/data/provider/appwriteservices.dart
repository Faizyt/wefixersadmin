import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:get/get.dart';
import 'package:wefixersadmin/app/data/services/appwrite/connection.dart';

import '../services/appwrite/const/const.dart';

class AppwriteServices {
  final Connection _connection = Connection();
  Future listVoluntears() async {
    Databases databases = Databases(_connection.client);
    try {
      final result = await databases.listDocuments(
          databaseId: DataBaseConst.voleantears,
          collectionId: CollectionConst.voluntearRegistration);
      return result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}