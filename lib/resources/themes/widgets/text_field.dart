import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/themes/styles/input_size.dart';
import 'package:flutter_app/resources/themes/styles/typo_skin.dart';
import 'package:flutter_app/resources/themes/widgets/button_size.dart';
import 'package:flutter_app/resources/themes/widgets/icon_data.dart';

import '../base_component.dart';

class FTextField extends StatefulWidget {
  FTextField({
    Key ?key,
    this.helperText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor = FColors.grey1,
    this.borderColor = FColors.grey4,
    this.subtitleColor,
    this.size = FInputSize.size56,
    this.autoFocus = false,
    this.controller,
    this.clearIcon,
    this.enabled = true,
    this.readOnly = false,
    this.focusColor = FColors.blue6,
    this.keyboardType,
    this.onTap,
    this.onChanged,
    this.validator,
    this.onSave,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.obscuringCharacter = "*",
    this.maxLength,
    this.counterText,
    this.errorText,
    this.maxLines,
    this.inputFormatter,
    this.borderErrorColor = FColors.red6,
    this.hintText = '',
    this.hintStyle,
    this.style,
    this.cursorHeight,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.labelStyle,
    this.padding,
    this.textAlign = TextAlign.start,
    this.helperTextColor,
    this.textInputAction,
    this.textImportant = false,
    this.onlyDoneAction = true,
    this.nameActionKeyboard = 'Xong',
    this.onClear,
    this.buildCounter,
  }) : super(key: key);

  final TextEditingController ?controller;
  final String ?helperText;
  final String ?labelText;
  final Widget ?prefixIcon;
  final Widget ?clearIcon;
  final Widget ?suffixIcon;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusColor;
  final Color ?subtitleColor;
  final Color borderErrorColor;
  final FInputSize size;
  final bool autoFocus;
  final bool enabled;
  final bool readOnly;
  final bool textImportant;
  final TextInputType ?keyboardType;
  final VoidCallback ?onTap;
  final ValueChanged<String>? onChanged;
  final Function ?onSave;
  final FormFieldValidator<String> ?validator;
  final VoidCallback ?onEditingComplete;
  final Function(String) ?onFieldSubmitted;
  final bool obscureText;
  final String obscuringCharacter;
  final int ?maxLength;
  final String ?counterText;
  final String ?errorText;
  final Color ?helperTextColor;
  final String hintText;
  final TextStyle ?hintStyle;
  final TextStyle ?style;
  final TextStyle ?labelStyle;
  final double ?cursorHeight;
  final int ?maxLines;
  final List<TextInputFormatter> ?inputFormatter;
  final FocusNode ?focusNode;
  final TextCapitalization textCapitalization;
  final EdgeInsets ?padding;
  final TextAlign textAlign;
  final bool onlyDoneAction;
  final String nameActionKeyboard;

  /// build widget hiển thị đếm kí tự
  final Widget Function(BuildContext, {int currentLength, bool isFocused, int maxLength}) ?buildCounter;
  final TextInputAction ?textInputAction;
  Function ?onClear;

  @override
  _FTextFieldState createState() => _FTextFieldState();
}

class _FTextFieldState extends State<FTextField> {
  bool _isFocus = false;
  bool _isShowClear = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.controller != null) {
      _controller = widget.controller!;
      _isShowClear = widget.controller!.text.isNotEmpty;
    }
    _controller.addListener(clearIconHandle);
    super.initState();
  }

  void clearIconHandle() {
    if (mounted) {
      if (_controller.text.isEmpty && _isShowClear) {
        setState(() {
          _isShowClear = false;
        });
      } else if (_controller.text.isNotEmpty && !_isShowClear) {
        setState(() {
          _isShowClear = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final hasExtendKeyboard = Platform.isIOS &&
    //     (widget.keyboardType == TextInputType.phone ||
    //         widget.keyboardType == TextInputType.number ||
    //         widget.keyboardType ==
    //             TextInputType.numberWithOptions(decimal: true));
    //final builder = widget.buildCounter ?? (_, {required int currentLength, required bool isFocused, int? maxLength}) => Container();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: widget.padding,
          height: widget.size.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(widget.size.borderRadius),
            border: Border.all(
              width: 1,
              color: widget.helperText != null
                  ? widget.borderErrorColor
                  : _isFocus
                      ? widget.focusColor
                      : widget.borderColor,
            ),
          ),
          child: Row(
            children: [
              _buildPrefixIcon(),
              Expanded(
                child: Focus(
                  onFocusChange: (value) {
                    setState(() {
                      _isFocus = value;
                    });
                    // if (!widget.readOnly) {
                    //   if (_isFocus) {
                    //     KeyboardOverlay.showOverlay(context, widget.onlyDoneAction, widget.nameActionKeyboard);
                    //   } else {
                    //     KeyboardOverlay.removeOverlay();
                    //   }
                    // }
                  },
                  child: Material(
                    color: FColors.transparent,
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(20.0) + EdgeInsets.fromLTRB(0, 0, 0, 44.0),
                      textAlign: widget.textAlign,
                      textCapitalization: widget.textCapitalization,
                      focusNode: widget.focusNode,
                      inputFormatters: widget.inputFormatter,
                      textInputAction: widget.textInputAction,
                      maxLines: widget.maxLines,
                      maxLength: widget.maxLength,
                      onChanged: widget.onChanged,
                      onTap: widget.onTap,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      validator: widget.validator,
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      autofocus: widget.autoFocus,
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      textAlignVertical: TextAlignVertical.center,
                      style: widget.style ??
                          TextStyle(
                            fontSize: 14,
                            color: FColors.grey10,
                          ),
                      cursorColor: FColors.grey10,
                      cursorHeight: widget.cursorHeight,
                      obscureText: widget.obscureText,
                      obscuringCharacter: widget.obscuringCharacter,
                      cursorWidth: 1,
                      onEditingComplete: widget.onEditingComplete,
                      // buildCounter: builder,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: FColors.grey10,
                        ),
                        counterText: widget.counterText,
                        hintText: widget.hintText,
                        label: widget.textImportant == true
                            ? Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        widget.labelText??'',
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Text(
                                        ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                        labelText: widget.textImportant == false ? widget.labelText : null,
                        labelStyle: widget.labelStyle ??
                            TextStyle(color: _isFocus ? widget.focusColor : FColorSkin.placeholder, height: 0.8),
                        // labelStyle: widget.labelStyle ??
                        //     TextStyle(
                        //         color: widget.helperText != null
                        //             ? widget.borderErrorColor
                        //             : _isFocus
                        //                 ? widget.focusColor
                        //                 : FColorSkin.placeHolder,
                        //         height: 0.8),
                        hintStyle:
                            widget.hintStyle ?? FTypoSkin.bodyText2.copyWith(color: FColorSkin.placeholder, height: 0),
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ),
              _isFocus && !widget.readOnly ? _buildClear() : SizedBox(),
              _buildSuffix(),
            ],
          ),
        ),
        if (widget.helperText != '')
          if (widget.helperText != null)
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              constraints: BoxConstraints(maxHeight: 32, minHeight: 16),
              child: Text(
                widget.helperText??'',
                overflow: TextOverflow.ellipsis,
                style: FTypoSkin.subtitle3.copyWith(color: widget.helperTextColor),
                maxLines: 2,
              ),
            ),
      ],
    );
  }

  Widget _buildPrefixIcon() => widget.prefixIcon != null
      ? Container(
          padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
          alignment: Alignment.center,
          child: widget.prefixIcon,
        )
      : Container(width: 16);

  Widget _buildClear() {
    if (_isShowClear) {
      return Padding(
        padding: EdgeInsets.only(right: 8, top: 2.2),
        child: FFilledButton.icon(
          onPressed: () {
            widget.controller!.clear();
            if (widget.onClear != null) {
              widget.onClear!();
            }
          },
          size: FButtonSize.size32,
          backgroundColor: FColorSkin.transparent,
          child: Align(
            alignment: Alignment.centerRight,
            child: FIcon(
              icon: FFilled.c_remove,
              size: 16,
              color: FColorSkin.subtitle,
            ),
          ),
        ),
      );
    }
    return Container();
  }

  Widget _buildSuffix() => widget.suffixIcon != null
      ? GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: 32,
            width: 32,
            padding: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: widget.suffixIcon,
          ),
        )
      : Container(width: widget.clearIcon != null ? 0 : 4);
}
