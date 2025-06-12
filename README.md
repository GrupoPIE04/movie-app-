# movie-app-
trabalho unsiales professor vito
# MovieApp

A Flutter application that displays a list of movies currently playing in theaters. Users can view details for each movie by tapping on a list item.

## Features

- Fetches and displays "Now Playing" movies from The Movie Database (TMDb) API.
- Shows movie posters, titles, and ratings.
- Tap a movie to see more details.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0 or higher recommended)
- [Dart SDK](https://dart.dev/get-dart) (usually included with Flutter)
- An editor like [VS Code](https://code.visualstudio.com/) or Android Studio

### Installation

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd movieapp
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Configure TMDb API Key:**
   - Obtain an API key from [TMDb](https://www.themoviedb.org/documentation/api).
   - Add your API key to the appropriate place in your code (usually in `movie_provider.dart`).

4. **Run the app:**
   ```
   flutter run
   ```

## Project Structure

- `lib/`
  - `main.dart` - Entry point of the app.
  - `movie_provider.dart` - Handles fetching movie data and state management.
  - `screens/`
    - `home_screen.dart` - Displays the list of movies.
    - `movie_detail_screen.dart` - Shows details for a selected movie.
  - `models/`
    - `movie.dart` - Movie data model.

## How It Works

- The app uses the `provider` package for state management.
- On startup, the app fetches the list of "Now Playing" movies from TMDb.
- Movies are displayed in a scrollable list with their poster, title, and rating.
- Tapping a movie navigates to a detail screen with more information.

## Dependencies

- [provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http)
- [flutter](https://flutter.dev/)

## Troubleshooting

- If you encounter issues with dependencies, run:
  ```
  flutter pub upgrade
  ```
- Make sure your API key is valid and has access to the TMDb API.

## License

This project is for educational purposes.
