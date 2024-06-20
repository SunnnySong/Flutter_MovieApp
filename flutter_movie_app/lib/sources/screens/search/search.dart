import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                onTap: () {
                  // 추천 검색어를 보여주는 화면으로 이동
                  controller.openView();
                },
                onChanged: (text) {
                  controller.openView();
                },
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF1C1C1E),
                ),
              );
            },
            suggestionsBuilder: (context, controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Container(
                    width: 140,
                    height: 198,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${11}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  subtitle: const Text('Hello'),
                  horizontalTitleGap: 20,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 56.0),
                  minVerticalPadding: 50,
                  onTap: () {
                    controller.closeView(item);
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
