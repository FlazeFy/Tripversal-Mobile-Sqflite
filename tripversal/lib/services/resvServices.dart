import 'package:tripversal/models/userModel.dart';
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
}