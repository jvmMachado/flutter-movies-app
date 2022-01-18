import 'package:get/get.dart';
import 'package:movies_app/services/login/login_service.dart';

class HomeController extends GetxController {
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  static const NAVIGATOR_KEY = 1;
  static const EXIT_PAGE_INDEX = 2;
  final LoginService _loginService;

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  final _pages = ['/movies', '/favorites'];

  void goToPage(int page) {
    _pageIndex(page);

    if (page == EXIT_PAGE_INDEX) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}
