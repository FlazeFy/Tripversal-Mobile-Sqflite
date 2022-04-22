import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_tripversal');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);

    return database;
  }
  _onCreatingDatabase(Database database, int version) async{
    await database.execute("CREATE TABLE user (id_user INTEGER PRIMARY KEY AUTOINCREMENT, id_card TEXT NOT NULL , fullname TEXT NOT NULL , password TEXT NOT NULL , email TEXT NOT NULL , phone TEXT NOT NULL)");
  }
}