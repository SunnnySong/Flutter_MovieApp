import 'package:flutter/material.dart';
import 'package:flutter_movie_app/sources/network/models/response.dart';
import 'package:flutter_movie_app/sources/screens/home/models/movie.dart';
import 'package:flutter_movie_app/sources/wigets/button.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '야곰 시네마',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF0F0F10),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.movie_creation_outlined),
              color: const Color(0xFFCCCCCC),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline_outlined),
              color: const Color(0xFFCCCCCC),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: const Color(0xFFCCCCCC),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                FirstSection(),
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0F0F10),
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

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  bool _isSelected = true;

  // 라디오 버튼처럼 A가 선택되면 B는 선택되지 않도록 하는 함수
  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      child: Row(
        children: [
          Button(
            onPressed: () {
              _toggleSelected();
            },
            isSelected: _isSelected,
            deselectedStyle: ButtonDecorationStyle(
              backgroundColor: Colors.transparent,
              foregroundColor: const Color(0xFFCCCCCC),
              borderColor: const Color(0xFF444444),
              borderWidth: 1,
            ),
            selectedStyle: ButtonDecorationStyle(
              backgroundColor: const Color(0xFFe64980),
              foregroundColor: Colors.white,
            ),
            text: "영화개봉순",
            cornerRadius: 48,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            verticalPadding: 13,
            horizantalPadding: 16,
          ),
          const SizedBox(
            width: 12,
          ),
          Button(
            onPressed: () {
              _toggleSelected();
            },
            isSelected: !_isSelected,
            deselectedStyle: ButtonDecorationStyle(
              backgroundColor: Colors.transparent,
              foregroundColor: const Color(0xFFCCCCCC),
              borderColor: const Color(0xFF444444),
              borderWidth: 1,
            ),
            selectedStyle: ButtonDecorationStyle(
              backgroundColor: const Color(0xFFe64980),
              foregroundColor: Colors.white,
            ),
            text: "예매율순",
            cornerRadius: 48,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            verticalPadding: 13,
            horizantalPadding: 16,
          ),
        ],
      ),
    );
  }
}
