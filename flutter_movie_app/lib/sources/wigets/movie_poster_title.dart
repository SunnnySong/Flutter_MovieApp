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

  final CrossAxisAlignment crossAxisAlignment;

  const MoviePosterTitleWidget({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.white,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          SizedBox(
            height: imageHeight,
            width: imageWidth,
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
                  height: imageHeight,
                  width: imageWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1C1C1C),
                  ),
                  child: const Center(
                    child: Text(
                      '이미지 \n준비중',
                      style: TextStyle(
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
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
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
