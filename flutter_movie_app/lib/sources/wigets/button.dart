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

class InteractiveButton extends StatefulWidget {
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
    required this.isSelected,
    required this.deselectedStyle,
    required this.selectedStyle,
    required this.text,
    required this.onPressed,
    required this.cornerRadius,
    this.verticalPadding,
    this.horizantalPadding,
    this.fontSize,
    this.fontWeight,
  });

  @override
  State<StatefulWidget> get createState => _InteractiveButtonState();
}

class _InteractiveButtonState extends State<InteractiveButton> {
  // 버튼이 선택되었을 때와 선택되지 않았을 때의 스타일을 반환하는 함수
  ButtonDecorationStyle get _style {
    return widget.isSelected ? widget.selectedStyle : widget.deselectedStyle;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // 버튼 클릭될 때 실행할 함수를 상위 위젯으로부터 받음.
          widget.onPressed();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? 0,
          horizontal: widget.horizantalPadding ?? 0,
        ),
        decoration: BoxDecoration(
          color: _style.backgroundColor,
          border: Border.all(
            color: _style.borderColor ?? Colors.transparent,
            width: _style.borderWidth ?? 0,
          ),
          borderRadius: BorderRadius.circular(
            widget.cornerRadius ?? 0,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _style.foregroundColor,
            fontSize: widget.fontSize ?? _style.fontSize,
            fontWeight: widget.fontWeight ?? _style.fontWeight,
          ),
        ),
      ),
    );
  }
}
