import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/Home/domain/repositories/homeRepo.dart';

import '../../../../core/failure/failures.dart';
import '../../data/models/RecommendedModel.dart';
@injectable
class GetRecommendedUseCase{
  HomeRepo homeRepo;

  GetRecommendedUseCase(this.homeRepo);
  Future<Either<RecommendedModel, Failures>>call()=>homeRepo.getRecommended();
}