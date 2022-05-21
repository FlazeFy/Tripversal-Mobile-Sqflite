class reviewModel{
  int idReview;
  int idUser;
  int idCarGuide;

  String fullname;
  String type;
  String comment;
  int rating;
  DateTime dateReview;
   
  reviewMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_review'] = idReview;
    mapping['id_user'] = idUser;
    mapping['fullname'] = fullname;
    mapping['id_car_guide'] = idCarGuide;
    mapping['type'] = type;
    mapping['comment'] = comment;
    mapping['rating'] = rating;
    mapping['dateReview'] = dateReview;

    return mapping;
  }
}