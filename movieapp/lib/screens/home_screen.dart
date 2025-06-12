import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../movie_provider.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).loadNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Filmes em Cartaz')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.movies.length,
              itemBuilder: (context, index) {
                final movie = provider.movies[index];
                return ListTile(
                  leading: movie.posterPath.isNotEmpty
                      ? Image.network('https://image.tmdb.org/t/p/w92${movie.posterPath}')
                      : const SizedBox(width: 50),
                  title: Text(movie.title),
                  subtitle: Text('Nota: ${movie.voteAverage}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}