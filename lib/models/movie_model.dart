class MovieModel {
  int id;
  String title;
  String img;
  String description;
  List<String> genres;
  num rating;
  num runtime;
  num year;

  MovieModel({
    required this.id,
    required this.title,
    this.img = 'https://rukminim2.flixcart.com/image/850/1000/poster/e/k/u/akhuratha-poster-movie-priest-hd-wallpaper-background-akmov3900-original-imaek7n4hfdnfdmw.jpeg?q=90&crop=false',
    required this.description,
    this.genres = const [],
    required this.rating,
    required this.runtime,
    required this.year,
  });

  // creation of DTO inside our model
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'summary': String summary,
        'background_image': String background_image,
        'year': num year,
        'rating': num rating,
        'runtime': num runtime,
        'genres': List<dynamic> genres,
      } =>
        MovieModel(
          title: title,
          id: id,
          // img: background_image,
          description: summary,
          runtime: runtime,
          year: year,
          rating: rating,
          genres: genres.map((v) => v.toString()).toList(),
        ),
      _ => throw const FormatException('Format not supported.'),
    };
  }
}