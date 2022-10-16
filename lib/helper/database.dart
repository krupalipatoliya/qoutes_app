import 'package:flutter_app/helper/api.dart';
import 'package:flutter_app/models/quotes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBData {
  static Database db;
  static Database fvDb;
  static String path;
  final String TABLE = "quotesTB";
  final String FVTABLE = "FavoriteTB";

  DBData._();



  initDB() async {
    if (db != null) {
      return null;
    } else {
      path = join(await getDatabasesPath(), "Quotes.db");
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          String query =
              "CREATE TABLE $TABLE(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,quotes TEXT)";
          return db.execute(query);
        },
      );
    }
  }

  Future saveData(Quotes q) async {
    await initDB();
    String query = "INSERT INTO $TABLE(name,quotes) VALUES(?,?)";
    List arg = [q.author, q.quotes];
    await db.rawInsert(query, arg);
  }

  Future getData() async {
    await initDB();
    String query = "SELECT * FROM $TABLE";
    List res = await db.rawQuery(query);

    return List.generate(
      res.length,
      (i) => Quotes.create(
        id: res[i]['id'],
        author: res[i]['name'],
        quotes: res[i]['quotes'],
      ),
    );
  }

  initFVDB() async {
    if (fvDb != null) {
      return null;
    } else {
      path = join(await getDatabasesPath(), "Favorite_Quotes.db");
      fvDb = await openDatabase(
        path,
        version: 1,
        onCreate: (fvDb, version) {
          String query =
              "CREATE TABLE $FVTABLE(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,quotes TEXT)";
          return fvDb.execute(query);
        },
      );
    }
  }

  insertFVDB(Quotes q) async {
    await initFVDB();
    String query = "INSERT INTO $FVTABLE(id,name,quotes) VALUES(?,?,?)";
    List arg = [q.id, q.author, q.quotes];
    int res = await fvDb.rawInsert(query, arg);
    return res;
  }

  getDataFVDB() async {
    await initFVDB();
    String query = "SELECT * FROM $FVTABLE";
    List res = await fvDb.rawQuery(query);
    return List.generate(
      res.length,
      (i) => Quotes.create(
        id: res[i]['id'],
        author: res[i]['name'],
        quotes: res[i]['quotes'],
      ),
    );
  }

  deleteFVDBDATA(int id) async {
    await initFVDB();
    String query = "DELETE FROM $FVTABLE WHERE id = ?";
    List arg = [id];
    int res = await fvDb.rawDelete(query, arg);
    return res;
  }

  Future deleteAllData() async {
    await initDB();
    await initFVDB();
    String query1 = "DELETE FROM $TABLE";
    String query2 = "DELETE FROM $FVTABLE";
    await db.rawDelete(query1);
    await fvDb.rawDelete(query2);
  }
}

DBData dbh = DBData._();
