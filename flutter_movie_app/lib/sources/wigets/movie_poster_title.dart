import 'package:flutter/material.dart';

class MoviePosterTitleWidget extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  final double spacing;

  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const MoviePosterTitleWidget({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.white,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Image.network(
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    color: const Color(0xFFCCCCCC),
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
              );
            },
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: spacing),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
