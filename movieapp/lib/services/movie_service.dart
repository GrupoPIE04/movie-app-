import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZmI5MWMyOTA0MWU5MTEwOGZhMjExNDFkM2YzMDA1MyIsIm5iZiI6MTc0NzMyNjk5OC45NDEsInN1YiI6IjY4MjYxODE2YmQ3NGU3YmMwNjBhODI2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NxFRsIOg2GbBOs73FXXOuazFNeYSfoAVPa-yr2OQ-VU';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchNowPlaying() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/now_playing?language=pt-BR'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }
}