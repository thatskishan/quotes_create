import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Globals/global.dart';

class DBHelpers {
  DBHelpers._();
  static final DBHelpers dbHelpers = DBHelpers._();

  Database? db;

  Future<void> initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, "quotes.db");

    db = await openDatabase(
      path,
      version: 6,
      onCreate: (Database db, int ver) async {
        String query =
            "CREATE TABLE IF NOT EXISTS quotesdata(Id INTEGER PRIMARY KEY AUTOINCREMENT,CategoryName TEXT NOT NULL, image BLOB);";
        String f_query =
            "CREATE TABLE IF NOT EXISTS f_query(Id INTEGER PRIMARY KEY AUTOINCREMENT,FQuotes TEXT NOT NULL);";
        String h_query =
            "CREATE TABLE IF NOT EXISTS h_query(Id INTEGER PRIMARY KEY AUTOINCREMENT,HQuotes TEXT NOT NULL);";
        String l_query =
            "CREATE TABLE IF NOT EXISTS l_query(Id INTEGER PRIMARY KEY AUTOINCREMENT,LQuotes TEXT NOT NULL);";
        String m_query =
            "CREATE TABLE IF NOT EXISTS m_query(Id INTEGER PRIMARY KEY AUTOINCREMENT,MQuotes TEXT NOT NULL);";
        String s_query =
            "CREATE TABLE IF NOT EXISTS s_query(Id INTEGER PRIMARY KEY AUTOINCREMENT,SQuotes TEXT NOT NULL);";
        String wallpaper_query =
            "CREATE TABLE IF NOT EXISTS wallpaper_query(wallpaperName TEXT NOT NULL);";
        String font_query =
            "CREATE TABLE IF NOT EXISTS font_query(fontName TEXT NOT NULL);";

        await db.execute(query);
        await db.execute(f_query);
        await db.execute(h_query);
        await db.execute(l_query);
        await db.execute(m_query);
        await db.execute(s_query);
        await db.execute(wallpaper_query);
        await db.execute(font_query);
      },
    );
  }

  Future insertRecord() async {
    await initDB();

    String query =
        "INSERT INTO quotesdata(CategoryName,Image) VALUES(?, ?, ?);";

    List args = [
      Global.quotesCategory.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchRecord() async {
    await initDB();

    String query = "SELECT * FROM quotesdata;";
    List allImage = await db!.rawQuery(query);

    List image = Global.quotesCategory;

    return image;
  }

  Future insertFRecord() async {
    await initDB();

    String query = "INSERT INTO f_query(FQuotes) VALUES(?, ?);";

    List args = [
      Global.friendshipQuotes.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchFRecord() async {
    await initDB();

    String query = "SELECT * FROM f_query;";
    List allQuotes = await db!.rawQuery(query);

    List fquotes = Global.friendshipQuotes;

    return fquotes;
  }

  Future insertHRecord() async {
    await initDB();

    String query = "INSERT INTO h_query(HQuotes) VALUES(?, ?);";

    List args = [
      Global.happinessQuotes.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchHRecord() async {
    await initDB();

    String query = "SELECT * FROM h_query;";
    List allQuotes = await db!.rawQuery(query);

    List hquotes = Global.happinessQuotes;

    return hquotes;
  }

  Future insertLRecord() async {
    await initDB();

    String query = "INSERT INTO l_query(LQuotes) VALUES(?, ?);";

    List args = [
      Global.loveQuotes.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchLRecord() async {
    await initDB();

    String query = "SELECT * FROM l_query;";
    List allQuotes = await db!.rawQuery(query);

    List lquotes = Global.loveQuotes;

    return lquotes;
  }

  Future insertMRecord() async {
    await initDB();

    String query = "INSERT INTO m_query(MQuotes) VALUES(?, ?);";

    List args = [
      Global.motivationalQuotes.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchMRecord() async {
    await initDB();

    String query = "SELECT * FROM m_query;";
    List allQuotes = await db!.rawQuery(query);

    List mquotes = Global.motivationalQuotes;

    return mquotes;
  }

  Future insertSRecord() async {
    await initDB();

    String query = "INSERT INTO s_query(MQuotes) VALUES(?, ?);";

    List args = [
      Global.successQuotes.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future fetchSRecord() async {
    await initDB();

    String query = "SELECT * FROM s_query;";
    List allQuotes = await db!.rawQuery(query);

    List squotes = Global.successQuotes;

    return squotes;
  }
}
