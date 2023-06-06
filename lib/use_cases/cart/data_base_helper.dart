import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/models/product/product.dart';

class DataBaseHelper {
  static const int _version = 2;
  static const String _dbName = 'Cart.db';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Cart(id INTEGER PRIMARY KEY, name TEXT NOT NULL, image_url TEXT NOT NULL, cost INTEGER NOT NULL, sizes TEXT NOT NULL, categoryId INTEGER NOT NULL,description TEXT NOT NULL, selectedCount INTEGER NOT NULL)"),
        version: _version);
  }

  static Future<int> addProduct(Product product) async {
    final db = await _getDB();
    return await db.insert('Cart', product.productToJson(product));
  }

  static Future<int> updateProduct(Product product) async {
    final db = await _getDB();
    return await db.update('Cart', product.productToJson(product),
        where: 'id = ?',
        whereArgs: [product.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteProduct(Product product) async {
    final db = await _getDB();
    return await db.delete(
      'Cart',
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  static Future<List<Product>?> getAllProducts() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('Cart');

    if (maps.isEmpty) {
      return [];
    }

    return List.generate(maps.length, (index) => Product.fromJson(maps[index]));
  }
}
