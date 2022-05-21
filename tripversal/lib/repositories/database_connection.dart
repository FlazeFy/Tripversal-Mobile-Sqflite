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
    await database.execute("CREATE TABLE car (id_car INTEGER PRIMARY KEY AUTOINCREMENT, plate TEXT NOT NULL, type TEXT NOT NULL, carname TEXT NOT NULL , location TEXT NOT NULL , price INTEGER NOT NULL , rating INTEGER, driver TEXT NOT NULL, seat INTEGER NOT NULL, tank INTEGER NOT NULL, distance INTEGER NOT NULL, desc TEXT NOT NULL)");
    await database.execute("CREATE TABLE guide (id_guide INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, price INTEGER NOT NULL , rating INTEGER, customer INTEGER NOT NULL, desc TEXT NOT NULL, phone TEXT NOT NULL, address TEXT NOT NULL, email TEXT NOT NULL)");
    await database.execute("CREATE TABLE history (id_history INTEGER PRIMARY KEY AUTOINCREMENT, id_user INTEGER, type TEXT NOT NULL, price INTEGER NOT NULL , rating INTEGER, name TEXT NOT NULL, phone TEXT NOT NULL, location TEXT NOT NULL, barcode TEXT NOT NULL, dateStart DATETIME NOT NULL, dateEnd DATETIME NOT NULL, dateComment DATETIME NOT NULL, comment TEXT NOT NULL)");
    await database.execute("CREATE TABLE ongoing (id_ongoing INTEGER PRIMARY KEY AUTOINCREMENT, id_user INTEGER, id_car_guide INTEGER, type TEXT NOT NULL, desc TEXT NOT NULL, dateStart DATETIME NOT NULL, dateEnd DATETIME NOT NULL)");
    await database.execute("CREATE TABLE review (id_review INTEGER PRIMARY KEY AUTOINCREMENT, id_user INTEGER, id_car_guide INTEGER, type TEXT NOT NULL, comment TEXT NOT NULL, rating INTEGER NOT NULL, dateReview DATETIME NOT NULL)");
    
    //Insert City Car Item 
    await database.execute("INSERT INTO car(id_car, plate, type, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1670 VZB', 'City Car', 'Honda Brio RS/2020', 'Bojongsoang', 290000, 5, 'Ben Parker', 5, 35, 12000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, type, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1140 AAB', 'City Car', 'Toyota Raize/2022', 'Bojongsoang', 340000, 5, 'none', 5, 35, 7000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, type, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 1910 CDB', 'City Car', 'Toyota Agya/2018', 'Baleendah', 275000, 5, 'Ben Parker', 5, 30, 52000, 'Lorem ipsum')");
    await database.execute("INSERT INTO car(id_car, plate, type, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 2410 VBZ', 'City Car', 'Honda Brio Satya/2019', 'Baleendah', 270000, 5, 'Craig Mckay', 5, 30, 31000, 'Lorem ipsum')");
  
    //Insert Minibus Item 
    await database.execute("INSERT INTO car(id_car, plate, type, carname, location, price, rating, driver, seat, tank, distance, desc) VALUES(null, 'D 3410 AAC', 'Minibus', 'Toyota Innova/2015', 'Buah Batu', 400000, 5, 'Ben Parker', 8, 50, 127000, 'Lorem ipsum')");

    //Insert Tour Guide Item 
    await database.execute("INSERT INTO guide(id_guide, name, price, rating, customer, desc, phone, address, email) VALUES(null, 'Ben Parker', 450000, 5, 0, 'Lorem ipsum', '81248857138', 'Jl. Telekomunikasi No.1', 'parkerben02@gmail.com')");
    await database.execute("INSERT INTO guide(id_guide, name, price, rating, customer, desc, phone, address, email) VALUES(null, 'Craig Mckay', 420000, 5, 0, 'Lorem ipsum', '8114881021', 'Jl. Mawar No.14', 'craigelll@gmail.com')");

    //Insert History Item 
    await database.execute("INSERT INTO history(id_history, id_user, type, price, rating, name, phone, location, barcode, dateStart, dateEnd, dateComment, comment) VALUES(null, 1, 'Honda Brio RS/2020', 290000, 5, 'Ben Parker', '81248857138', 'Bojongsoang', 'A9J48FHJS', '2022-05-04 10:37:20', '2022-05-05 10:10:45', '2022-05-06 13:40:20', 'Lorem ipsum')");
    await database.execute("INSERT INTO history(id_history, id_user, type, price, rating, name, phone, location, barcode, dateStart, dateEnd, dateComment, comment) VALUES(null, 1, 'Tour Guide', 420000, 5, 'Craig Mckay', '8114881021', 'Jl. Mawar No.14', 'C91416HJA', '2022-05-04 09:00:00', '2022-05-04 21:00:00', '2022-05-06 13:45:20', 'Lorem ipsum')");

    //Insert OnGoing Item 
    await database.execute("INSERT INTO ongoing(id_ongoing, id_user, id_car_guide, type, desc, dateStart, dateEnd) VALUES(null, 1, 1, 'Car Rental', 'D 1670 VZB', '2022-05-01 10:37:20', '2022-05-03 10:10:45')");

    //Insert Review Item 
    await database.execute("INSERT INTO review(id_review, id_user, id_car_guide, type, comment, rating, dateReview) VALUES(null, 1, 1, 'Car Rental', 'This car is well maintained by the owner, have clean interior, and also experienced driver', 5, '2022-05-02 10:10:45')");
  }
}