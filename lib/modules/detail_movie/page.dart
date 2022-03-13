import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie.dart';

class DetailMoviePage extends StatelessWidget {
  final Result? movie;

  const DetailMoviePage({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> movieDetails = [
      {
        'title': 'Title',
        'value': movie?.title != null ? movie?.title : movie?.originalName,
      },
      {
        'title': 'Release Year',
        'value': DateTime.parse(movie?.releaseDate != null
                ? movie?.releaseDate ?? ''
                : movie?.firstAirDate ?? '')
            .year
            .toString(),
      },
      {
        'title': 'Vote Average',
        'value': movie?.voteAverage.toString(),
      },
      {
        'title': 'Overview',
        'value': movie?.overview,
      },
      {
        'title': 'Popularity',
        'value': movie?.popularity.toString(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(movie?.title != null
            ? movie?.title ?? ''
            : movie?.originalName ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500/" + movie!.posterPath!,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: movieDetails.length,
              separatorBuilder: (_, index) => SizedBox(height: 8),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  minVerticalPadding: 4,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  title: Text(movieDetails[index]['title']),
                  subtitle: Text(movieDetails[index]['value']),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
