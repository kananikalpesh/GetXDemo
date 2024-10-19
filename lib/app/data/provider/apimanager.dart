import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kktest/app/data/provider/weburl.dart';

class ApiManager {
  static final ApiManager apiManager = ApiManager();
  static ApiManager get instance => apiManager;

  Future<Map> getRequest(String page) async {
    var result = await http.get(Uri.parse(WebURL.baseUrl + page));
    if (result.statusCode != 200) {
      return {"error": "data not found", "status": false};
    }

    return jsonDecode(result.body);
  }
}
