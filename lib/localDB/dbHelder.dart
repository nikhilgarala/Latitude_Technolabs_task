import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE orderList(
        id INTEGER PRIMARY KEY NOT NULL,
        title TEXT,
        image TEXT,
        price TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

    await database.execute("""CREATE TABLE orderListDetails(
        id INTEGER PRIMARY KEY NOT NULL,
        title TEXT,
        address TEXT,
        price TEXT,
        category TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'task.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
      String title, String image, String price, int ids) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'image': image, 'price': price, 'id': ids};
    final id = await db.insert('orderList', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // fororderDetails
  static Future<int> createOrderDetailItem(
  {String title, String address, String price, String category,int ids}) async {
    final db = await SQLHelper.db();

    final data = {
      'id' : ids,
      'title': title,
      'address': address,
      'price': price,
      'category': category
    };
    final id = await db.insert('orderListDetails', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('orderList', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getOrderItemDetails() async {
    final db = await SQLHelper.db();
    return db.query('orderListDetails', orderBy: "id");
  }

// // Read a single item by id
// // The app doesn't use this method but I put here in case you want to see it
static Future<List<Map<String, dynamic>>> getOrderItemDetailsRecord(int id) async {
  final db = await SQLHelper.db();
  return db.query('orderListDetails', where: "id = ?", whereArgs: [id], limit: 1);
}
//
// // Update an item by id
// static Future<int> updateItem(
//     int id, String title, String? descrption) async {
//   final db = await SQLHelper.db();
//
//   final data = {
//     'title': title,
//     'description': descrption,
//     'createdAt': DateTime.now().toString()
//   };
//
//   final result =
//   await db.update('items', data, where: "id = ?", whereArgs: [id]);
//   return result;
// }

// Delete
// static Future<void> deleteItem(int id) async {
//   final db = await SQLHelper.db();
//   try {
//     await db.delete("items", where: "id = ?", whereArgs: [id]);
//   } catch (err) {
//     debugPrint("Something went wrong when deleting an item: $err");
//   }
// }
}
