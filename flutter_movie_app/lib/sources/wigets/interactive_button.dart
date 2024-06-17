import 'package:flutter/material.dart';

class ButtonDecorationStyle {
  final Color backgroundColor;
  final Color foregroundColor;

  final Color? borderColor;
  final double? borderWidth;

  double? fontSize;
  FontWeight? fontWeight;

  ButtonDecorationStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.borderWidth,
  });
}

class InteractiveButton extends StatelessWidget {
  final ButtonDecorationStyle deselectedStyle;
  final ButtonDecorationStyle selectedStyle;

  final String text;

  final double? cornerRadius;
  final double? verticalPadding;
  final double? horizantalPadding;
  final double? fontSize;
  final FontWeight? fontWeight;

  final Function onPressed;
  final bool isSelected;

  const InteractiveButton({
    super.key,
    required this.deselectedStyle,
    required this.selectedStyle,
    required this.text,
    this.cornerRadius,
    this.verticalPadding,
    this.horizantalPadding,
    this.fontSize,
    this.fontWeight,
    required this.onPressed,
    required this.isSelected,
  });

  ButtonDecorationStyle get _style {
    return isSelected ? selectedStyle : deselectedStyle;
  }

  @override
  Widget build(BuildContext context) {
    // 버튼이 선택되었을 때와 선택되지 않았을 때의 스타일을 반환하는 함수

    return GestureDetector(
      onTap: () {
        // setState(() {
        // 버튼 클릭될 때 실행할 함수를 상위 위젯으로부터 받음.
        onPressed();
        // });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizantalPadding ?? 0,
        ),
        decoration: BoxDecoration(
          color: _style.backgroundColor,
          border: Border.all(
            color: _style.borderColor ?? Colors.transparent,
            width: _style.borderWidth ?? 0,
          ),
          borderRadius: BorderRadius.circular(
            cornerRadius ?? 0,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _style.foregroundColor,
            fontSize: fontSize ?? _style.fontSize,
            fontWeight: fontWeight ?? _style.fontWeight,
          ),
        ),
      ),
    );
  }
}
