
import 'package:exam_repo_n8/services/data/local/database_sql/db.dart';
import 'package:exam_repo_n8/services/data/models/adress_model.dart';
import 'package:flutter/cupertino.dart';

class DatabaseProvider with ChangeNotifier {
  List<AddressModel> addresses = [];

  DatabaseProvider() {
    getAddresses();
  }

  getAddresses() async {
    addresses = await LocalDatabase.getAllAddresses();
    // print("CURRENT LENGTH:${addresses.length}");
    notifyListeners();
  }

  insertAddress(AddressModel userAddress) async {
    await LocalDatabase.insertAddress(userAddress);
    getAddresses();
  }

  deleteAddress(int id) async {
    await LocalDatabase.deleteAddressByID(id);
    getAddresses();
  }

  deleteAllAddress() async {
    await LocalDatabase.deleteAllAddresses();
    getAddresses();
  }
}
