import 'package:flutter/foundation.dart';
import 'models/movie.dart';
import 'services/movie_service.dart' as service;

class MovieProvider extends ChangeNotifier {
  final service.MovieService _service = service.MovieService();
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> loadNowPlaying() async {
    _isLoading = true;
    notifyListeners();
    _movies = await _service.fetchNowPlaying();
    _isLoading = false;
    notifyListeners();
  }
}