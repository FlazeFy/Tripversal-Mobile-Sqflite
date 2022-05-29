class guideModel{
   int idGuide;

   String name;
   String language;
   int price;
   int rating;
   int customer;
  String desc;
  String phone;
  String address;
  String email;
   
  guideMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_guide'] = idGuide;
    mapping['name'] = name;
    mapping['language'] = language;
    mapping['price'] = price;
    mapping['rating'] = rating;
    mapping['customer'] = customer;
    mapping['desc'] = desc;
    mapping['phone'] = phone;
    mapping['address'] = address;
    mapping['email'] = email;

    return mapping;
  }
}