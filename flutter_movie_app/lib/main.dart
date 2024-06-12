import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// screens
import 'sources/screens/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}
