import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_provider.dart';
import 'screens/home_screen.dart'; // Update this path if your HomeScreen is in the 'screens' folder

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: const MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      theme: ThemeData(
        colorSchemeSeed: Colors.red, // Use this for Material 3 theming
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}