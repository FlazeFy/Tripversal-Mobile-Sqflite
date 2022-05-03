import 'package:sqflite/sqflite.dart';
import 'package:tripversal/repositories/database_connection.dart';

class Repository{
  DatabaseConnection _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection();
  }
  
  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async{
    var connection = await database;
  
    return await connection.insert(table, data);
  }

  readData(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM user WHERE id_user=?', ['1']);
  }
  readCarData(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM car');
  }

  readCarDataById(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM car WHERE id_car=?', ['']);
  }

  //New.
  checkData(table, data) async{
    var connection = await database;
    connection.rawQuery('SELECT * FROM user WHERE fullname=? AND password=?', data);

  }
}