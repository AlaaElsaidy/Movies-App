import 'package:dartz/dartz.dart';
import 'package:movies/core/failure/failures.dart';
import 'package:movies/features/Home/data/models/PopularModel.dart';
import 'package:movies/features/Home/data/models/RecommendedModel.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';
import 'package:movies/features/Home/data/models/upcomingModel.dart';

abstract class HomeRepo {
  Future<Either<PopularModel, Failures>> getPopular();

  Future<Either<UpcomingModel, Failures>> getUpComing();

  Future<Either<RecommendedModel, Failures>> getRecommended();
  Future<Either<MovieDetailsModel, Failures>> getDetails(String id);
}
