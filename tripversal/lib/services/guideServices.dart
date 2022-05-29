import 'package:tripversal/models/guideModel.dart';
import 'package:tripversal/repositories/repository.dart';

class guideServices{
  Repository _repository;

  guideServices(){
    _repository = Repository();
  }
  readGuide() async{
    return await _repository.readGuideData('guide');
  }
  readGuideID() async{
    return await _repository.readGuideDataID('guide');
  }
  readGuideEN() async{
    return await _repository.readGuideDataEN('guide');
  }
  readGuideES() async{
    return await _repository.readGuideDataES('guide');
  }
  readGuidewReview() async{
    return await _repository.readReviewGuide('guide');
  }
}