import 'package:flutter/material.dart';

import '../../../../models/movie_details_model.dart';

class MovieDetailsContentOverview extends StatelessWidget {
  final MovieDetailsModel? movieDetails;

  const MovieDetailsContentOverview({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movieDetails?.overview ?? '',
          style: const TextStyle(
            fontSize: 14,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
