import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends ChangeNotifier {
  HomeController() {
    run();
  }
  List<Movie> movieList = [];
  List<Movie> movieList2 = [];
  List<Movie> movieList3 = [];

  Future<void> getMovies(int page) async {
    String apiKey = "f04342b213d1dcadca727ce7312d3baf";
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=$page");
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    for (var i in responseBody['results']) {
      switch (page) {
        case 1:
          movieList.add(Movie.fromJson(i));

          break;
        case 2:
          movieList2.add(Movie.fromJson(i));

          break;
        case 3:
          movieList3.add(Movie.fromJson(i));

          break;
      }
    }
  }

  Future<String> getTrailerKey(int id) async {
    String apiKey = "f04342b213d1dcadca727ce7312d3baf";
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey&language=en-US");
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    return responseBody['results'][0]['key'];
  }

  void run() async {
    await getMovies(1);
    await getMovies(2);
    await getMovies(3);
    notifyListeners();
  }
}
