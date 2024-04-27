import '../models/searchModel.dart';

abstract class SearchDs{
  Future<SearchModel> search(String searchtxt);
}