import 'package:flutter/material.dart';
import '../models/movie.dart'; // Import the shared Movie model

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (movie.posterPath.isNotEmpty)
              Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            const SizedBox(height: 16),
            Text(
              movie.overview,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Nota: ${movie.voteAverage}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}