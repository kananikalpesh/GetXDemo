import 'package:get/get.dart';
import 'package:kktest/app/data/models/userdata.dart';
import 'package:kktest/app/modules/home/repository/home_repo.dart';
import 'package:kktest/app/utils/toastmanager.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  RxList<UserData> userdatalist = RxList();
  int page = 1;
  RxBool hasLoadMore = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration.zero,
      () => getUserData(),
    );
  }

  getUserData() async {
    try {
      page = 1;
      userdatalist.value = await homeRepo.getUserList(page);
    } catch (e) {
      showMessage(e.toString());
    }
  }

  loadMore() async {
    if (!hasLoadMore.value) {
      try {
        hasLoadMore.value = true;
        page++;
        List<UserData> user = await homeRepo.getUserList(page);
        userdatalist.addAll(user);
        userdatalist.refresh();
      } catch (e) {
        showMessage(e.toString());
      }
      hasLoadMore.value = false;
    }
  }
}
