import 'package:tripversal/models/messageModel.dart';
import 'package:tripversal/repositories/repository.dart';

class carServices{
  Repository _repository;

  carServices(){
    _repository = Repository();
  }

  readCar() async{
    return await _repository.readCarData('car');
  }
  readGarage() async{
    return await _repository.readGarageData('garage');
  }
  readCarwReview() async{
    return await _repository.readReviewCar('car');
  }
  readMessage() async{
    return await _repository.readMessageAll('message');
  }
  readContact() async{
    return await _repository.readSocial('social');
  }
  sendMessage(messageModel message) async{
    return await _repository.insertMessage('message', message.messageMap2());
  }
  unSendMessage(idMessage) async{
    return await _repository.deleteMessage('message', idMessage);
  }
}