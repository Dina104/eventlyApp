import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.KeyboardType = TextInputType.text,
    this.isSecure = false,
    required this.validator,
    required this.controller,
    this.hint,
    this.lines = 1,
  });
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType KeyboardType;
  final bool isSecure;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final int lines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.lines,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isSecure,
      keyboardType: widget.KeyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon,
        labelText: widget.label,
        hintText: widget.hint,
      ),
    );
  }
}
