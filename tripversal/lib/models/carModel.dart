class carModel{
   int idCar;

   String plate;
   String type;
   String carname;
   String location;
  String driver;
   int price;
   int rating;
   int seat;
   int tank;
   int distance;
    String desc;
   
  carMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_car'] = idCar;
    mapping['plate'] = plate;
    mapping['type'] = type;
    mapping['carname'] = carname;
    mapping['location'] = location;
    mapping['price'] = price;
    mapping['rating'] = rating;
    mapping['seat'] = seat;
    mapping['tank'] = tank;
    mapping['driver'] = driver;
    mapping['distance'] = distance;
    mapping['desc'] = desc;

    return mapping;
  }
}