import 'package:despezaz/models/transaction.dart';
import 'package:hive/hive.dart';

class DbServices {
  static const String boxName = "transactions";

  static Future<void> saveTransaction(Transaction t) async{
    var box = await Hive.openBox<Transaction>(boxName);
    await box.put(t.id, t);
  }

  static Future<List<Transaction>> getTransactions() async{
    var box = await Hive.openBox<Transaction>(boxName);
    return box.values.toList();
  }

  static Future<void> deleteTransaction(int id) async {
    var box = await Hive.openBox<Transaction>(boxName);
    await box.delete(id);
  }
}