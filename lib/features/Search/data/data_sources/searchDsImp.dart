import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies/core/api/apiManager.dart';
import 'package:movies/core/api/endPoints.dart';
import 'package:movies/features/Search/data/data_sources/searchDs.dart';
import 'package:movies/features/Search/data/models/searchModel.dart';

import '../../../../core/utilies/constatnts.dart';
@Injectable(as: SearchDs)
class SearchDsImp implements SearchDs{
  ApiManager apiManager;

  SearchDsImp(this.apiManager);

  @override
  Future<SearchModel> search(String searchtxt) async{
    var response=await apiManager.getData(EndPoints.searchEndPoint,headers: {
      "Authorization":Constants.token
    },
      params: {
      "query":searchtxt
      }
    );
    var json=jsonDecode(response.body);
    return SearchModel.fromJson(json);
  }

}