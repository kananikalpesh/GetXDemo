import 'package:kktest/app/data/models/userdata.dart';
import 'package:kktest/app/data/provider/apimanager.dart';

class HomeRepo {
  Future<List<UserData>> getUserList(int page) async {
    Map responce =
        await ApiManager.instance.getRequest("?page=$page&results=15");

    if (responce['status'] == false) {
      throw Exception(responce['error'] ?? "Something is missing..");
    }

    return List.from(responce['results'])
        .map((e) => UserData.fromJson(e))
        .toList();
  }
}
