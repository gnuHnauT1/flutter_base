import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/themes/styles/typo_skin.dart';

import '../styles/input_size.dart';
import '../base_component.dart';

class FTextFormField extends FFormField<String> {

  FTextFormField({
    Key? key,
    this.controller,
    FFormFieldValidator<String> ?validator,
    String ?helperText,
    String ?labelText,
    Widget ?prefixIcon,
    Widget ?clearIcon,
    Widget ?suffixIcon,
    Color backgroundColor = FColors.grey1,
    Color enabledColor = FColors.grey4,
    Color disabledColor = FColors.grey3,
    Color errorColor = FColors.red6,
    Color successColor = FColors.green6,
    Color helperTextColor = FColors.grey9,
    Color borderErrorColor = FColors.red6,
    Color borderColor = FColorSkin.grey2,
    Color focusColor = FColors.blue5,
    FInputSize size = FInputSize.size56,
    bool autoFocus = false,
    bool enabled = true,
    bool readOnly = false,
    bool obscureText = false,
    bool isImportant = false,
    TextInputType ?keyboardType,
    VoidCallback ?onTap,
    ValueChanged<String> ?onChanged,
    ValueChanged<String> ?onSubmitted,
    Function ?onClear,
    String ?initialValue,
    AutovalidateMode ?autovalidateMode,
    FormFieldSetter<String> ?onSaved,
    int ?maxLength,
    int maxLine = 1,
    String ?counterText,
    String ?hintText,
    TextStyle ?hintStyle,
    TextStyle ?labelStyle,
    double ?cursorHeight,
    FocusNode ?focusNode,
    TextStyle style = FTypoSkin.buttonText3,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter> ?inputFormatters,
    TextInputAction ?textInputAction,
    TextAlign textAlign = TextAlign.start,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          validator: validator,
          onSaved: onSaved,
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          builder: (FFormFieldState<String> field) {
            final state = field as _FTextFormFieldState;
            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return FTextField(
                key: key,
                controller: state._effectiveController,
                textCapitalization: textCapitalization,
                inputFormatter: inputFormatters,
                focusNode: focusNode,
                borderColor: borderColor,
                borderErrorColor: borderErrorColor,
                style: style,
                textImportant: isImportant,
                textAlign: textAlign,
                textInputAction: textInputAction,
                cursorHeight: cursorHeight,
                hintStyle: hintStyle,
                labelStyle: labelStyle,
                hintText: hintText??'',
                helperText: field.statusText ?? helperText,
                helperTextColor: field.status == TFStatus.normal
                    ? helperTextColor
                    : field.status == TFStatus.success
                        ? Colors.green
                        : errorColor,
                labelText: labelText,
                prefixIcon: prefixIcon,
                clearIcon: clearIcon,
                focusColor: focusColor,
                // focusColor: field.status == TFStatus.normal
                //     ? focusColor
                //     : field.status == TFStatus.success
                //         ? Colors.green
                //         : errorColor,
                maxLength: maxLength,
                maxLines: maxLine,
                onFieldSubmitted: onSubmitted,
                suffixIcon: suffixIcon,
                backgroundColor: backgroundColor,
                size: size,
                autoFocus: autoFocus,
                enabled: enabled,
                readOnly: readOnly,
                keyboardType: keyboardType,
                onChanged: onChangedHandler,
                onTap: onTap,
                counterText: counterText,
                obscureText: obscureText,
                onClear: onClear);
          },
        );

  final TextEditingController ?controller;

  @override
  FFormFieldState<String> createState() {
    return _FTextFormFieldState();
  }
}

class _FTextFormFieldState extends FFormFieldState<String> {
  late TextEditingController _controller;

  TextEditingController get _effectiveController => widget.controller ?? _controller;

  @override
  FTextFormField get widget => super.widget as FTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(FTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller = TextEditingController.fromValue(oldWidget.controller!.value);
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          // Chỉ gán _controller khi widget.controller != null
          _controller = TextEditingController(text: widget.controller!.text);
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String value) {
    super.didChange(value);

    if (_effectiveController.text != value) _effectiveController.text = value;
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue!;
    });
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value) didChange(_effectiveController.text);
  }
}

enum statusValidate { error, success }
