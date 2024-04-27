import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure/failures.dart';
import 'package:movies/features/Home/data/data_sources/homeDs.dart';
import 'package:movies/features/Home/data/models/PopularModel.dart';
import 'package:movies/features/Home/data/models/RecommendedModel.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';
import 'package:movies/features/Home/data/models/upcomingModel.dart';
import 'package:movies/features/Home/domain/repositories/homeRepo.dart';
@Injectable(as:HomeRepo)
class HomeRepoImp implements HomeRepo{
  HomeDs homeDs;

  HomeRepoImp(this.homeDs);

  @override
  Future<Either<PopularModel, Failures>> getPopular() async{
   try{
     var response=await homeDs.getPopular();
     return left(response);
   }catch(e){
     print(e.toString());
     return right(RemoteFailures(e.toString()));
   }
  }

  @override
  Future<Either<RecommendedModel, Failures>> getRecommended()async {
    try{
      var response=await homeDs.getRecommended();
      return left(response);
    }catch(e){
      return right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<UpcomingModel, Failures>> getUpComing()async {
    try{
      var response=await homeDs.getUpComing();
      return left(response);
    }catch(e){
      return right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<MovieDetailsModel, Failures>> getDetails(String id)async {
    try{
      var response=await homeDs.getDetails(id);
      return left(response);
    }catch(e){
      return right(RemoteFailures(e.toString()));
    }
  }

}