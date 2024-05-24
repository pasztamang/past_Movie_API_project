import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/movie_model.dart';
import '../../widgets/movies/movie_tile.dart';
import 'package:http/http.dart' as http;

class MoviesByCategoryScreen extends StatefulWidget {
  final String category;
  const MoviesByCategoryScreen({super.key, required this.category});
  @override
  State<MoviesByCategoryScreen> createState() => _MoviesByCategoryScreenState();
}

class _MoviesByCategoryScreenState extends State<MoviesByCategoryScreen> {
    List<MovieModel> movieList = [];
    bool loading = true;
  @override
  void initState() {
    loadMovieCategory();
  }

  Future<void> loadMovieCategory() async {
    final res = await http.get(Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?genre=' + widget.category));
    // print(jsonDecode(res.body)['data']['movies']);
    List<MovieModel> tempMovies = [];

    for(final movie in jsonDecode(res.body)['data']['movies']){
        tempMovies.add(MovieModel.fromJson(movie));
    }

    // print(tempMovies);
    setState(() {
       movieList = tempMovies;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    // List<MovieModel> movieList = Provider.of<MovieProvider>(context,listen:false).getMoviesByCategory(widget.category);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Container(
        child: movieList.length == 0 ? Center(
          child: Text('No movies available for this category'),
        ):ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieTile(movie: movieList[index]);
            }),
      ),
    );
  }
}
