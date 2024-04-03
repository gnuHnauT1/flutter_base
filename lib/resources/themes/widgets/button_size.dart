import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/styles/typo_skin.dart';

class FButtonSize {
  const FButtonSize({
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.textStyle,
    required this.iconSize,
  });

  final double height;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final Radius borderRadius;
  final TextStyle textStyle;

  static const FButtonSize size24 = FButtonSize(
    height: 24,
    iconSize: 12,
    borderRadius: Radius.circular(4.0),
    textStyle: FTypoSkin.buttonText4,
    padding: EdgeInsets.symmetric(horizontal: 8),
  );

  static const FButtonSize size32 = FButtonSize(
    height: 32,
    iconSize: 16,
    borderRadius: Radius.circular(4.0),
    textStyle: FTypoSkin.buttonText2,
    padding: EdgeInsets.symmetric(horizontal: 12),
  );

  static const FButtonSize size40 = FButtonSize(
    height: 40,
    iconSize: 20,
    borderRadius: Radius.circular(8.0),
    textStyle: FTypoSkin.buttonText3,
    padding: EdgeInsets.symmetric(horizontal: 16),
  );

  static const FButtonSize size48 = FButtonSize(
    height: 48,
    iconSize: 24,
    borderRadius: Radius.circular(8.0),
    textStyle: FTypoSkin.buttonText1,
    padding: EdgeInsets.symmetric(horizontal: 24),
  );

  FButtonSize copyWith({
    double? height,
    double? iconSize,
    Radius? borderRadius,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? iconPadding,
  }) {
    return FButtonSize(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      iconSize: iconSize ?? this.iconSize,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
