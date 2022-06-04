class carModel{
   int idCar;
   int idOwner;

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
  String coordinate_lan;
  String coordinate_lng;
  String owner_name;
  String owner_location;
  String owner_phone;
  String owner_email;
   
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
    mapping['coordinate_lan'] = coordinate_lan;
    mapping['coordinate_lng'] = coordinate_lng;
    mapping['id_owner'] = idOwner;
    mapping['owner_name'] = owner_name;
    mapping['owner_phone'] = owner_phone;
    mapping['owner_location'] = owner_location;
    mapping['owner_email'] = owner_email;

    return mapping;
  }
}