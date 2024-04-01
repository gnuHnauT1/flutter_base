import 'package:core_system/Component/widgets/button_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_component.dart';

class FFilledButton extends StatelessWidget {
  const FFilledButton({
    Key ?key,
    required this.child,
    this.backgroundColor = Colors.blue,
    this.size = FButtonSize.size40,
    this.textColor = Colors.white,
    this.disabledColor = Colors.grey,
    required this.onPressed,
  })  : this.isIcon = false,
        super(key: key);

  const FFilledButton.icon({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.blue,
    this.disabledColor = Colors.grey,
    this.size = FButtonSize.size40,
    this.textColor = Colors.white,
    required this.onPressed,
  })  : this.isIcon = true,
        super(key: key);

  final Widget child;
  final Color textColor;
  final Color backgroundColor;
  final Color disabledColor;
  final FButtonSize size;
  final VoidCallback onPressed;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      disabledColor: FColors.transparent,
      onPressed: onPressed,
      minSize: size.height < 40 ? 40 : size.height,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      child: Container(
        height: size.height,
        width: isIcon ? size.height : null,
        padding: isIcon ? null : size.padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: isIcon ? BorderRadius.circular(size.height / 2) : BorderRadius.all(size.borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              overflow: TextOverflow.ellipsis,
              style: size.textStyle.copyWith(height: 0, color: textColor),
              maxLines: 1,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
