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
    await database.execute("CREATE TABLE car (id_car INTEGER PRIMARY KEY AUTOINCREMENT, plate TEXT NOT NULL , carname TEXT NOT NULL , location TEXT NOT NULL , price INTEGER NOT NULL , rating INTEGER, driver TEXT NOT NULL, seat INTEGER NOT NULL, tank INTEGER NOT NULL, distance INTEGER NOT NULL, desc TEXT NOT NULL)");
    
    //Insert Car Item 
    await database.execute("INSERT INTO car(id_car, plate, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1670 VZB', 'Honda Brio RS/2020', 'Bojongsoang', 290000, 5, 'Ben Parker', 5, 35, 12000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1140 AAB', 'Toyota Raize/2022', 'Bojongsoang', 340000, 5, 'none', 5, 40, 7000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1910 CDB', 'Toyota Agya/2018', 'Baleendah', 275000, 5, 'Ben Parker', 5, 35, 52000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 2410 VBZ', 'Honda Brio Satya/2019', 'Baleendah', 270000, 5, 'Kreig Maycalle', 5, 30, 31000, 'Lorem ipsum')");
  }
}