class resvModel{
  int idHistory;
  int idUser;
  int idCarGuide;

  String type;
  int price;
  int rating;
  String name;
  String phone;
  String location;
  String barcode;
  String driver;
  DateTime dateStart;
  DateTime dateEnd;
  DateTime dateComment;
  String comment;
   
  resvMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_history'] = idHistory;
    mapping['id_user'] = idUser;
    mapping['id_car_guide'] = idCarGuide;
    mapping['type'] = type;
    mapping['price'] = price;
    mapping['rating'] = rating;
    mapping['name'] = name;
    mapping['phone'] = phone;
    mapping['driver'] = driver;
    mapping['location'] = location;
    mapping['barcode'] = barcode;
    mapping['dateStart'] = dateStart;
    mapping['dateEnd'] = dateEnd;
    mapping['dateComment'] = dateComment;
    mapping['comment'] = comment;

    return mapping;
  }
}