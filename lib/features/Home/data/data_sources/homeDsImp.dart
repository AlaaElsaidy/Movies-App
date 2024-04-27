import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies/core/api/apiManager.dart';
import 'package:movies/core/api/endPoints.dart';
import 'package:movies/core/utilies/constatnts.dart';
import 'package:movies/features/Home/data/data_sources/homeDs.dart';
import 'package:movies/features/Home/data/models/PopularModel.dart';
import 'package:movies/features/Home/data/models/RecommendedModel.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';
import 'package:movies/features/Home/data/models/upcomingModel.dart';


@Injectable(as: HomeDs)
class HomeDsImp extends HomeDs{
  ApiManager apiManager;

  HomeDsImp(this.apiManager);

  @override
  Future<PopularModel> getPopular() async{
    var response=await apiManager.getData(EndPoints.popularEndPoint,headers: {
      "Authorization":Constants.token

    });
    var json=jsonDecode(response.body);
    return PopularModel.fromJson(json);
  }

  @override
  Future<RecommendedModel> getRecommended() async{
    var response=await apiManager.getData(EndPoints.recommendedEndPoint,headers: {
      "Authorization":Constants.token
    });
    var json=jsonDecode(response.body);
    return RecommendedModel.fromJson(json);
  }

  @override
  Future<UpcomingModel> getUpComing()async {
    var response=await apiManager.getData(EndPoints.upcomingEndPoint,headers: {
      "Authorization":Constants.token
    });
    var json=jsonDecode(response.body);
    return UpcomingModel.fromJson(json);
  }

  @override
  Future<MovieDetailsModel> getDetails(String id)async {
    var response=await apiManager.getData(EndPoints.detailsEndPoint+id,headers: {
      "Authorization":Constants.token
    });
    var json=jsonDecode(response.body);
    return MovieDetailsModel.fromJson(json);
  }

}