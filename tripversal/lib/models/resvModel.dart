class resvModel{
  int idHistory;
  int idUser;

  String type;
  int price;
  int rating;
  String name;
  String phone;
  String location;
  String barcode;
  DateTime dateStart;
  DateTime dateEnd;
  DateTime dateComment;
  String comment;
   
  resvMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_history'] = idHistory;
    mapping['id_user'] = idUser;
    mapping['type'] = type;
    mapping['price'] = price;
    mapping['rating'] = rating;
    mapping['name'] = name;
    mapping['phone'] = phone;
    mapping['location'] = location;
    mapping['barcode'] = barcode;
    mapping['dateStart'] = dateStart;
    mapping['dateEnd'] = dateEnd;
    mapping['dateComment'] = dateComment;
    mapping['comment'] = comment;

    return mapping;
  }
}