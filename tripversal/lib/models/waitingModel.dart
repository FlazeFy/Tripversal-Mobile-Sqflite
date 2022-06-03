class waitingModel{
  int idWaiting;
  int idUser;
  int idCarGuide;

  int price;
  String type;
  String status;
  String carname;
  DateTime dateStart;
  DateTime dateEnd;
   
  waitingMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_waiting'] = idWaiting;
    mapping['id_user'] = idUser;
    mapping['id_car_guide'] = idCarGuide;
    mapping['carname'] = carname;
    mapping['type'] = type;
    mapping['price'] = price;
    mapping['status'] = status;
    mapping['dateStart'] = dateStart;
    mapping['dateEnd'] = dateEnd;

    return mapping;
  }
}