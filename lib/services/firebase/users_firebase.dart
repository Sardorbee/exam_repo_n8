import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_repo_n8/services/data/models/universal_data.dart';
import 'package:exam_repo_n8/services/data/models/users_model.dart';

class UserService {
  static Future<UniversalData> addUser({required UserModel userModel}) async {
    try {
      DocumentReference newUser = await FirebaseFirestore.instance
          .collection("users")
          .add(userModel.toJson());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(newUser.id)
          .update({
        "usersId": newUser.id,
      });

      return UniversalData(data: "User added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> updateUser(
      {required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userModel.usersId)
          .update(userModel.toJson());

      return UniversalData(data: "User updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> deleteuser({required String usersId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(usersId)
          .delete();

      return UniversalData(data: "User deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
