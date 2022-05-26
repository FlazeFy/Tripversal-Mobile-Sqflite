import 'package:tripversal/models/carModel.dart';
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
  readCarwReview() async{
    return await _repository.readReviewCar('car');
  }
  readCarwMessage() async{
    return await _repository.readMessageCar('message');
  }
  readCarwContact1() async{
    return await _repository.readContact1Car('message');
  }
  readCarwContact2() async{
    return await _repository.readContact2Car('message');
  }
  sendMessage(messageModel message) async{
    return await _repository.insertMessage('message', message.messageMap2());
  }
}