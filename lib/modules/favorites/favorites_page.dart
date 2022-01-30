import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/application/ui/widgets/movie_card.dart';
import 'package:movies_app/modules/favorites/favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favoritos'),
      ),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: SingleChildScrollView(
              child: SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: controller.movies
                        .map(
                          (movie) => MovieCard(
                              movie: movie,
                              favoriteCallBack: () =>
                                  controller.removeFavorite(movie)),
                        )
                        .toList(),
                  )),
            ),
          );
        },
      ),
    );
  }
}
