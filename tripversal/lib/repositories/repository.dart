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
    return await connection.rawQuery('SELECT * FROM user');
  }
  readCarData(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM car JOIN garage ON car.id_garage = garage.id_garage ORDER BY price ASC');
  }
  readGarageData(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM garage');
  }
  readGuideData(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM guide');
  }
  readGuideDataID(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM guide where language like?', ['%ID%']);
  }
  readGuideDataEN(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM guide where language like?', ['%EN%']);
  }
  readGuideDataES(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM guide where language like?', ['%ES%']);
  }
  
  readHistoryDataById(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM history WHERE id_user=?', ['1']);
  }
  readOnGoingDataById(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM ongoing WHERE id_user=?', ['1']);
  }
  readWaitingDataById(table) async{
    var connection = await database;
    // return await connection.query(table);
    return await connection.rawQuery('SELECT * FROM waiting JOIN car ON waiting.id_car_guide = car.id_car WHERE id_user=?', ['1']);
  }

  checkData(table, data) async{
    var connection = await database;
    return await connection.rawQuery('SELECT id_user FROM user WHERE fullname=? AND password=?', [data['fullname'], data['password']]);
  }

  readReviewCar(table) async{
    var connection = await database;
    return await connection.rawQuery('SELECT review.id_review, review.id_user, user.fullname, review.id_car_guide, review.type, review.comment, review.rating, dateReview FROM review JOIN car ON review.id_car_guide = car.id_car JOIN user ON review.id_user = user.id_user');
  }
  readReviewGuide(table) async{
    var connection = await database;
    return await connection.rawQuery('SELECT review.id_review, review.id_user, user.fullname, review.id_car_guide, review.type, review.comment, review.rating, dateReview FROM review JOIN guide ON review.id_car_guide = guide.id_guide JOIN user ON review.id_user = user.id_user');
  }
  readSocial(table) async{
    var connection = await database;
    return await connection.rawQuery('SELECT * FROM social');
  }
  readMessageAll(table) async{
    var connection = await database;
    return await connection.rawQuery('SELECT * FROM message');
  }
  insertMessage(table, data) async{
    var connection = await database;
  
    return await connection.insert(table, data);
  }

  updateData(table, data) async{
    var connection = await database;
    return await connection.update(table, data, where: 'id_user=?', whereArgs: [data['id_user']]);
  }
}