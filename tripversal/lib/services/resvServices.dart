import 'package:tripversal/models/waitingModel.dart';
import 'package:tripversal/repositories/repository.dart';

class resvServices{
  Repository _repository;

  resvServices(){
    _repository = Repository();
  }

  readHistory() async{
    return await _repository.readHistoryDataById('history');
  }
  readOnGoing() async{
    return await _repository.readOnGoingDataById('ongoing');
  }
  readWaiting() async{
    return await _repository.readWaitingDataById('waiting');
  }
  createPayment(waitingModel waiting) async{
    return await _repository.insertWaiting('waiting', waiting.waitingMap2());
  }
}