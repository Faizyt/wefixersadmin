import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:get/get.dart';
import 'package:wefixersadmin/app/data/services/appwrite/connection.dart';
import 'package:wefixersadmin/app/data/services/appwrite/const/const.dart';

class VoluntearRegistrationProvider {
  final Connection _connection = Connection();
  Future registerVoluntear(Map data, String id) async {
    Databases databases = Databases(_connection.client);
    try { 
      final result = await databases.createDocument(  
          databaseId: DataBaseConst.voleantears,
          collectionId: CollectionConst.voluntearRegistration,
          documentId: id,
          data: data);
      return result;
    } catch (e) {
      // 
      Get.snackbar("Error", e.toString());
    }
  }

  // upload image 
  Future uploadImage(String id, String path, String name) async {
    Storage storage = Storage(_connection.client);
    try {
      final result = await storage.createFile(
          fileId: id,
          bucketId: StorageConst.profileImages,
          file: InputFile.fromPath(path: path, filename: name)
          );
      return result;
    } catch (e) {
      // 
      Get.snackbar("Error", e.toString());
    }
  }
}
