import 'package:get/get.dart';
import 'package:movies_app/modules/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginService: Get.find()));
  }
}
