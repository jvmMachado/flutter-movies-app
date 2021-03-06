import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:movies_app/application/bindings/application_bindings.dart';
import 'package:movies_app/modules/home/home_module.dart';
import 'package:movies_app/modules/login/login_module.dart';
import 'package:movies_app/modules/movie_detail/movie_details_module.dart';

import 'application/ui/movies_app_ui_config.dart';
import 'modules/splash/splash_module.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  RemoteConfig.instance.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MoviesAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: MoviesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailsModule().routers,
      ],
    );
  }
}
