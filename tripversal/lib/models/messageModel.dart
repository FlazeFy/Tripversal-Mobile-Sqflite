class messageModel{
  int idMessage;
  String sender;
  String receiver;

  String type;
  String body;
  String imageURL;
  DateTime datetime;
   
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
}