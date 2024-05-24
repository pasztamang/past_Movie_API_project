import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/screens/movie/movie_details.dart';
import 'package:movie/screens/movie/movie_details.dart';
import 'package:provider/provider.dart';

class CategoriesMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Categories?????'),
      ),
    );
  }
}
// class movie extends StatefulWidget {
//   int movieId;

//   MovieDetails({required this.movieId});

//   @override
//   State<MovieDetails> createState() => _MovieCategoryState();
// }

// class _MovieCategoryState extends State<MovieDetails> {
//   bool loading = true;
//   List<MovieModel> movieSuggestions = [];
//   @override
//   void initState() {
//     loadMovieSuggestions(widget.movieId.toString());
//   }

//   Future<void> loadMovieSuggestions(String id) async {
//     final res = await http.get(Uri.parse(
//         'https://yts.mx/api/v2/movie_suggestions.json?movie_id=' + id));
//     // print(jsonDecode(res.body)['data']['movies']);
//     List<MovieModel> tempMovies = [];

//     for(final movie in jsonDecode(res.body)['data']['movies']){
//         tempMovies.add(MovieModel.fromJson(movie));
//     }

//     // print(tempMovies);
//     setState(() {
//       movieSuggestions = tempMovies;
//       loading = false;
//     });
//   }