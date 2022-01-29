import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_detail_model.dart';

class MovieDetailsHeader extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
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
