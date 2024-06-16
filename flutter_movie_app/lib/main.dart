import 'package:flutter/material.dart';
// import 'package:flutter_movie_app/sources/routing/app_router.dart';
import 'package:flutter_movie_app/sources/screens/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  ));
}
