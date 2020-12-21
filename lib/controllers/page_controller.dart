import 'package:get/get.dart';

class PagesController extends GetxController {
  final _pageindex = 0.obs;

  int get pindex => _pageindex.value;

  set pindex(int value) => _pageindex.value = value;

  void savedIndex(int value) {
    _pageindex.value = value;
    update();
  }
}
