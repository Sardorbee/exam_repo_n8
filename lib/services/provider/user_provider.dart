import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_repo_n8/services/data/models/universal_data.dart';
import 'package:exam_repo_n8/services/data/models/users_model.dart';
import 'package:exam_repo_n8/services/firebase/users_firebase.dart';

import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserProvider(
    this.userService,
  );

  final UserService userService;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isloading = false;
  String fcm = '';
  updateFCM(fCM) {
    fcm = fCM;
    notifyListeners();
  }

  updateLoading() {
    isloading = !isloading;
    notifyListeners();
  }

  String selectedUserRole = 'Admin';
  tozalash() {
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    notifyListeners();
  }

  Future<void> addUsers({
    required BuildContext context,
    required UserModel userModel,
  }) async {
    updateLoading();
    UniversalData universalData =
        await UserService.addUser(userModel: userModel);
    updateLoading();
    tozalash();

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> updateUsers({
    required BuildContext context,
    required UserModel userModel,
  }) async {
    updateLoading();
    UniversalData universalData =
        await UserService.updateUser(userModel: userModel);
    updateLoading();
    tozalash();

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> deleteUsers({
    required BuildContext context,
    required String usersId,
  }) async {
    updateLoading();
    UniversalData universalData =
        await UserService.deleteuser(usersId: usersId);
    updateLoading();

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
        Navigator.pop(context);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Stream<List<UserModel>> getUsers() =>
      FirebaseFirestore.instance.collection("users").snapshots().map(
            (event1) => event1.docs
                .map((doc) => UserModel.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<UserModel>> getUsersById(String userId) {
    final databaseReference = FirebaseFirestore.instance.collection('users');

    return databaseReference
        .where('productId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    notifyListeners();
  }

  updateUserRole(value) {
    selectedUserRole = value;
    notifyListeners();
  }
}
