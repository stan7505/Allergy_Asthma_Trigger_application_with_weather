// user_info.dart
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
part 'user_info.g.dart';

@Collection()
class Database {
  Id id = Isar.autoIncrement;
  late List<String> allergens;
}

class UserInfo extends ChangeNotifier {
  late Isar isar;
  bool _initialized = false;
  late Future<void> initialization;

  UserInfo() {
    initialization = initialize();
  }

  Future<void> initialize() async {
    if (_initialized) return;
    final dir = await getApplicationDocumentsDirectory();
    isar = Isar.getInstance() ??
        await Isar.open([DatabaseSchema], directory: dir.path);
    _initialized = true;
  }

  List<String> allergylist = [
    'Pollen',
    'Dust',
    'Mold',
    'Pet Dander',
    'Food',
    'Insect Sting',
    'Latex',
    'Medication',
  ];

  Future<void> addAllergen(String allergen) async {
    if (!_initialized) {
      print('Isar is not initialized yet!');
      return;
    }
    try {
      final db = await isar.databases.where().findFirst() ?? Database();
      db.allergens = db.allergens..add(allergen);
      await isar.writeTxn(() async {
        await isar.databases.put(db);
      });
      notifyListeners();
    } catch (e) {
      print('Error adding allergen: $e');
    }
  }

  Future<void> removeAllergen(String allergen) async {
    if (!_initialized) {
      print('Isar is not initialized yet!');
      return;
    }
    try {
      final db = await isar.databases.where().findFirst() ?? Database();
      db.allergens = db.allergens..remove(allergen);
      await isar.writeTxn(() async {
        await isar.databases.put(db);
      });
      notifyListeners();
    } catch (e) {
      print('Error removing allergen: $e');
    }
  }

  Future<List<String>> getAllergens() async {
    if (!_initialized) {
      print('Isar is not initialized yet!');
      return [];
    }
    try {
      final db = await isar.databases.where().findFirst();
      return db?.allergens ?? [];
    } catch (e) {
      print('Error getting allergens: $e');
      return [];
    }
  }
}