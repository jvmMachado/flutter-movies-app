import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movies_app/application/ui/widgets/movie_card.dart';
import 'package:movies_app/models/movie_model.dart';

import '../movies_controller.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MovieModel> moviesList;

  const MoviesGroup({
    Key? key,
    required this.title,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 260,
            child: Obx(
              () {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    var movie = moviesList[index];
                    return MovieCard(
                      movie: movie,
                      favoriteCallBack: () =>
                          controller.toggleFavoriteMovie(movie),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
