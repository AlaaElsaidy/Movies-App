import 'package:movies/features/Home/data/models/PopularModel.dart';
import 'package:movies/features/Home/data/models/RecommendedModel.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';
import 'package:movies/features/Home/data/models/upcomingModel.dart';

abstract class HomeDs{
  Future<PopularModel> getPopular();
  Future<RecommendedModel> getRecommended();
  Future<UpcomingModel> getUpComing();
  Future<MovieDetailsModel> getDetails(String id);
}