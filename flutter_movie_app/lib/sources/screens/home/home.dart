import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/network/network_client/network_Client.dart';
import 'package:logger/logger.dart';

import 'package:chopper/chopper.dart';
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
    final client = NetworkClient().client;
    final movieService = MovieService.create(client);

    final response = await movieService.getLastedMovie();
    if (response.isSuccessful) {
      // Successful request
      // final body = response.body;
      _logger.i(body);
      _logger.i(response.base.request);
      _logger.i(response.statusCode);
      // _logger.i(body);
    } else {
      // Error code received from server
      // final code = response.statusCode;
      final error = response.error;
      _logger.i(error);
    }
  }
}
