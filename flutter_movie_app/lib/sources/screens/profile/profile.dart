import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _appBar(),
      body: const Center(
        child: Text('프로필 화면입니다.'),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        '프로필',
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
          icon: const Icon(Icons.menu),
          color: const Color(0xFFCCCCCC),
        ),
      ],
    );
  }
}
