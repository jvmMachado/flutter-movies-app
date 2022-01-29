import 'package:flutter/material.dart';

import '../../../../models/movie_details_model.dart';

class MovieDetailsContentProductionCompanies extends StatelessWidget {
  final MovieDetailsModel? movieDetails;

  const MovieDetailsContentProductionCompanies(
      {Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5),
        child: RichText(
          text: TextSpan(
              text: 'Companhia(s) produtora(s): ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
              children: [
                TextSpan(
                  text: movieDetails?.productionCompanies.join(', ') ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF222222),
                  ),
                ),
              ]),
        ));
  }
}
