import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'] ?? '',
        posterPath = json['poster_path'] ?? '',
        voteAverage = (json['vote_average'] ?? 0).toDouble();
}

class MovieService {
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZmI5MWMyOTA0MWU5MTEwOGZhMjExNDFkM2YzMDA1MyIsIm5iZiI6MTc0NzMyNjk5OC45NDEsInN1YiI6IjY4MjYxODE2YmQ3NGU3YmMwNjBhODI2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NxFRsIOg2GbBOs73FXXOuazFNeYSfoAVPa-yr2OQ-VU';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchNowPlaying() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey&language=pt-BR'));
    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }
}