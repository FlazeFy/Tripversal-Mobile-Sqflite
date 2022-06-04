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

  //New.
  loginAccount(userModel user) async{
    return await _repository.checkData('user', user.userMap());
  }
  editAccount(userModel user) async{
    return await _repository.updateData('user', user.userEditMap());
  }
}