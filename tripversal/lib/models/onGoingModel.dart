class onGoingModel{
  int idOnGoing;
  int idUser;
  int idCarGuide;

  String type;
  String desc;
  DateTime dateStart;
  DateTime dateEnd;
   
  onGoingMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_ongoing'] = idOnGoing;
    mapping['id_user'] = idUser;
    mapping['id_car_guide'] = idCarGuide;
    mapping['type'] = type;
    mapping['desc'] = desc;
    mapping['dateStart'] = dateStart;
    mapping['dateEnd'] = dateEnd;

    return mapping;
  }
}