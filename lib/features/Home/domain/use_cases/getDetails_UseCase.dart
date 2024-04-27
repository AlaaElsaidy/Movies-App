import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/Home/domain/repositories/homeRepo.dart';

import '../../../../core/failure/failures.dart';
import '../../data/models/movieDetailsModel.dart';

@injectable
class GetDetailsUseCase{
  HomeRepo homeRepo;

  GetDetailsUseCase(this.homeRepo);
  Future<Either<MovieDetailsModel, Failures>>call(String id)=>homeRepo.getDetails(id);
}