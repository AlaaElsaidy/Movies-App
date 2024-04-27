import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movies/core/failure/failures.dart';
import 'package:movies/features/Search/data/data_sources/searchDs.dart';

import 'package:movies/features/Search/data/models/searchModel.dart';

import '../../domain/repositories/searchRepo.dart';
@Injectable(as:SearchRepo)
class SearchRepoImp implements SearchRepo{
  SearchDs searchDs;

  SearchRepoImp(this.searchDs);

  @override
  Future<Either<SearchModel, Failures>> search(String searchtxt)async {
    try{
      var response=await searchDs.search(searchtxt);
      return left(response);
    }catch(e){
      return right(RemoteFailures(e.toString()));
    }
  }

}