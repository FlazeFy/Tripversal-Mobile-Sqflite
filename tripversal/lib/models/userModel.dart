class userModel{
   int idUser;

   String fullname;
   String idCard;
   String password;
   String email;
   String phone;

  userMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_user'] = null;
    mapping['id_Card'] = idCard;
    mapping['fullname'] = fullname;
    mapping['password'] = password;
    mapping['email'] = email;
    mapping['phone'] = phone;

    return mapping;
  }

  // //New.
  // loginuserMap(){
  //   var mapping = Map<String, dynamic>();

  //   mapping['fullname'] = fullname;
  //   mapping['password'] = password;

  //   return mapping;
  // }
}