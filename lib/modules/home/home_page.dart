import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/application/ui/movies_app_icons_icons.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';
import 'package:movies_app/modules/home/home_controller.dart';

import '../favorites/favorites_page.dart';
import '../movies/movies_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(MoviesAppIcons.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
        );
      }),
      body: Navigator(
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        initialRoute: '/movies',
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }

          return null;
        },
      ),
    );
  }
}
