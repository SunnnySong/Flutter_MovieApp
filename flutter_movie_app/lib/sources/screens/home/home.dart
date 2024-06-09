import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/network/models/response.dart';
import 'package:flutter_movie_app/sources/screens/home/models/movie.dart';
import 'package:logger/logger.dart';

import 'package:flutter_movie_app/sources/network/services/movie_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: doNetwork,
            child: const Text('Fetch Latest Movie'),
          ),
        ),
      ),
    );
  }

  void doNetwork() async {
    final movieService = MovieService.create();
    final response = await movieService.fetchLastedMovie();
    _logger.i(response);
    final result = response.body;

    if (result is Success<Movie>) {
      _logger.i(result.value.id);
      _logger.i(result.value.originCountry);
      _logger.i(result.value.originalTitle);
    } else if (result is Error<Movie>) {
      _logger.i(result.exception);
    }
  }
}
