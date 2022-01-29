import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/modules/movie_detail/widgets/movie_details_content/movie_details_content_title.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieDetailsModel? movieDetails;

  const MovieDetailsContent({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDetailsContentTitle(movieDetails: movieDetails),
      ],
    );
  }
}
