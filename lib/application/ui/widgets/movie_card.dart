import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:movies_app/application/ui/movies_app_icons_icons.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('y');
  final MovieModel movie;
  final VoidCallback favoriteCallBack;

  MovieCard({
    Key? key,
    required this.movie,
    required this.favoriteCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/movie/detail', arguments: movie.id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 148,
        height: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w200${movie.posterPath}',
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dateFormat.format(DateTime.parse(movie.releaseDate)),
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: -3,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 13,
                    icon: Icon(
                        movie.favorite
                            ? MoviesAppIcons.heart
                            : MoviesAppIcons.heart_empty,
                        color: movie.favorite ? context.themeRed : Colors.grey),
                    onPressed: favoriteCallBack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
