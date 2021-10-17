import 'package:get/get.dart';

class IndexController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedIndexTabbar = 0.obs;

  void onItemTapped(var index) {
    selectedIndex.value = index;
    update();
  }

  void onItemTabbar(var index) {
    selectedIndexTabbar.value = index;
    update();
  }
}
