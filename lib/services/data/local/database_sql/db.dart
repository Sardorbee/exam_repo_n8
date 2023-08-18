// ignore: depend_on_referenced_packages
import 'package:exam_repo_n8/services/data/models/adress_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("user_addresses.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const doubleType = "REAL DEFAULT 0.0";

    await db.execute('''
    CREATE TABLE ${AddressModelFields.addressTable}(
    ${AddressModelFields.id} $idType,
    ${AddressModelFields.lat} $doubleType,
    ${AddressModelFields.long} $doubleType,
    ${AddressModelFields.address} $textType,
    ${AddressModelFields.type} $textType,
    ${AddressModelFields.createdAt} $textType,
    ${AddressModelFields.etaj} $textType,
    ${AddressModelFields.house} $textType,
    ${AddressModelFields.orientir} $textType,
    ${AddressModelFields.podyezd} $textType
    );
    ''');
  }

  static Future<AddressModel> insertAddress(
      AddressModel locationUserModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        AddressModelFields.addressTable, locationUserModel.toJson());

    return locationUserModel.copyWith(id: id);
  }

  static Future<List<AddressModel>> getAllAddresses() async {
    List<AddressModel> allLocationUser = [];
    final db = await getInstance.database;
    allLocationUser = (await db.query(AddressModelFields.addressTable))
        .map((e) => AddressModel.fromJson(e))
        .toList();

    return allLocationUser;
  }

  static deleteAddressByID(int id) async {
    final db = await getInstance.database;
    db.delete(
      AddressModelFields.addressTable,
      where: "${AddressModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllAddresses() async {
    final db = await getInstance.database;
    db.delete(
      AddressModelFields.addressTable,
    );
  }
}
