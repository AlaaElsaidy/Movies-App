import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/Home/domain/repositories/homeRepo.dart';

import '../../../../core/failure/failures.dart';
import '../../data/models/upcomingModel.dart';
@injectable
class GetUpComingUseCase{
  HomeRepo homeRepo;

  GetUpComingUseCase(this.homeRepo);
  Future<Either<UpcomingModel, Failures>>call()=>homeRepo.getUpComing();
}