import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/Home/domain/repositories/homeRepo.dart';

import '../../../../core/failure/failures.dart';
import '../../data/models/PopularModel.dart';
@injectable
class GetPopularUseCase{
  HomeRepo homeRepo;

  GetPopularUseCase(this.homeRepo);
  Future<Either<PopularModel, Failures>>call()=>homeRepo.getPopular();
}