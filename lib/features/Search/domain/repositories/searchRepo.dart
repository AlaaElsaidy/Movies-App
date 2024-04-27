import 'package:dartz/dartz.dart';
import '../../../../core/failure/failures.dart';
import '../../data/models/searchModel.dart';

abstract class SearchRepo {
  Future<Either<SearchModel, Failures>> search(String searchtxt);
}
