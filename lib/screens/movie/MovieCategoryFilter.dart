
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/screens/movie/categories_movie_screen.dart';
import 'package:movie/screens/movie/movie_details.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MovieCategory extends StatefulWidget {
  int movieCat;

  MovieCategory({required this.movieCat});

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieDetails> {
  bool loading = true;
  List<MovieModel> movieFilterlist = [];
  @override
  void initState() {
    //loadMovieCategory(widget.movieCat.toString());
  }

  Future<void> loadMovieCategory(String id) async {
    final res = await http.get(Uri.parse(
        'https://yts.mx/api/v2/movie_suggestions.json?movie_id=' + id));
    // print(jsonDecode(res.body)['data']['movies']);
    List<MovieModel> tempMovies = [];

    for(final movie in jsonDecode(res.body)['data']['movies']){
        tempMovies.add(MovieModel.fromJson(movie));
    }

    // print(tempMovies);
    setState(() {
       tempMovies;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<MovieProvider>(context, listen: false)
        //.getMovieById(widget.movieCat);

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: loading? Center(
          child:  CircularProgressIndicator(),
        ): Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
              
              ],
            ),
          ),
        ));
  }
}