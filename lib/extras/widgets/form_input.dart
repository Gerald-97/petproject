import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';

class FormInput extends StatelessWidget {
  final Color backgroundColor, hintColor, focusColor;
  final String hintText, labelText, errorText;
  final bool enabled, obscureText;
  final TextInputType textInputType;
  final Widget prefixWidget, prefixIcon, suffixIcon;
  final Function validator, onSaved, onChanged, onEditingComplete;

  FormInput({
    this.backgroundColor,
    this.hintColor,
    this.focusColor,
    this.errorText,
    this.prefixWidget,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.obscureText,
    this.labelText,
    this.textInputType,
    this.hintText,
    this.validator,
    this.onSaved,
    this.onEditingComplete,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool _enabled = enabled ?? true;
    bool _obscureText = obscureText ?? false;
    String _errorText = errorText ?? 'Invalid';
    Widget _suffixIcon = suffixIcon ?? null;
    Color _backgroundColor = backgroundColor ?? MyColors.fadedPink;
    TextInputType _textInputType = textInputType ?? TextInputType.text;

    return TextFormField(
      onChanged: onChanged,
      enabled: _enabled,
      obscureText: _obscureText,
      keyboardType: _textInputType,
      validator: validator,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        suffixIcon: _suffixIcon,
//        errorText: _errorText,
//        errorBorder: OutlineInputBorder(
//          borderRadius: BorderRadius.circular(5),
//          borderSide: BorderSide(
//            color: MyColors.errorRed,
//          ),
//        ),
        prefix: prefixWidget ?? null,
        prefixIcon: prefixIcon ?? null,
        labelText: labelText ?? null,
        labelStyle: TextStyle(fontSize: 14, color: MyColors.defaultPink),
        filled: true,
        fillColor: _enabled ? _backgroundColor : MyColors.fadedHintBlack,
        hintText: hintText,
        hintStyle: TextStyle(
          color: _enabled ? MyColors.opaquePurple : MyColors.titleBlack,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusColor ?? MyColors.focusGreen,
          ),
        ),
//        focusedErrorBorder: OutlineInputBorder(
//          borderSide: BorderSide(
//            color: MyColors.errorRed,
//          ),
//        ),
      ),
    );
  }
}
