import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';

class MovieDetailsHeader extends StatelessWidget {
  final MovieDetailsModel? movieDetails;

  const MovieDetailsHeader({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movieDetails != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieDetails!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieDetails!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
