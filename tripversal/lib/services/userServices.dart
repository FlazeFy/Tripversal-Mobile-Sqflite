import 'package:tripversal/models/userModel.dart';
import 'package:tripversal/repositories/repository.dart';

class userServices{
  Repository _repository;

  userServices(){
    _repository = Repository();
  }

  createAccount(userModel user) async{
    return await _repository.insertData('user', user.userMap());
  }

  readUser() async{
    return await _repository.readData('user');
  }
}