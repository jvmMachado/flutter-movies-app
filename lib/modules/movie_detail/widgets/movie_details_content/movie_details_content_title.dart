import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';

import '../../../../models/movie_details_model.dart';

class MovieDetailsContentTitle extends StatelessWidget {
  final MovieDetailsModel? movieDetails;

  const MovieDetailsContentTitle({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            movieDetails?.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          RatingStars(
            value: ((movieDetails?.stars ?? 1) / 2),
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          const SizedBox(height: 10),
          Text(
            movieDetails?.genres.map((genre) => genre.name).join(', ') ?? '',
            style: TextStyle(
              fontSize: 11,
              color: context.themeGray,
            ),
          ),
        ],
      ),
    );
  }
}
