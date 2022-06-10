class messageModel{
  int idMessage;
  String sender;
  String receiver;

  String type;
  String body;
  String imageURL;
  DateTime datetime;

  //Social Map
  int idSocial;
  String garage_guide;
  String username;
   
  messageMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_message'] = idMessage;
    mapping['sender'] = sender;
    mapping['receiver'] = receiver;
    mapping['type'] = type;
    mapping['body'] = body;
    mapping['imageURL'] = imageURL;
    mapping['datetime'] = datetime;

    return mapping;
  }
  messageMap2(){
    var mapping = Map<String, dynamic>();

    mapping['id_message'] = null;
    mapping['sender'] = sender;
    mapping['receiver'] = receiver;
    mapping['type'] = type;
    mapping['body'] = body;
    mapping['imageURL'] = imageURL;
    mapping['datetime'] = datetime.toIso8601String();

    return mapping;
  }
  socialMap(){
    var mapping = Map<String, dynamic>();

    mapping['id_social'] = null;
    mapping['garage_guide'] = garage_guide;
    mapping['username'] = username;

    return mapping;
  }
}