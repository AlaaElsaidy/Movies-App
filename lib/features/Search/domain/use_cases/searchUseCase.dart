import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/Search/domain/repositories/searchRepo.dart';

import '../../../../core/failure/failures.dart';
import '../../data/models/searchModel.dart';

@injectable
class SearchUseCase{
  SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  Future<Either<SearchModel, Failures>>call(String searchtxt)=>searchRepo.search(searchtxt);

}