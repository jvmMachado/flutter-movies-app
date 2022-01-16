import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/images/login-background.png',
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: Get.width * .60,
                    height: 42,
                    child: SignInButton(Buttons.Google,
                        text: 'Entrar com o google',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () => controller.login()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
