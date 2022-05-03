import 'package:tripversal/models/carModel.dart';
import 'package:tripversal/repositories/repository.dart';

class carServices{
  Repository _repository;

  carServices(){
    _repository = Repository();
  }

  readCar() async{
    return await _repository.readCarData('car');
  }
}