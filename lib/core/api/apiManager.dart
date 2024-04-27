
import 'package:http/http.dart'as http;
import 'package:injectable/injectable.dart';


import '../utilies/constatnts.dart';
@injectable
class ApiManager{

  Future<http.Response> getData(String endPoint,
      {Map<String, dynamic>? params,Map<String, String>? headers}) async {
    Uri url = Uri.https(
        Constants.baseUrl,
        endPoint,
         params
    );
    http.Response response = await http.get(url, headers: headers,);
    return response;
  }
}