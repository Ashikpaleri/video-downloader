
import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final TextEditingController ? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final String? text;
  final Widget? prefix;
  const CustomTextFiled({Key? key,this.controller,this.validator, this.text, this.inputType, this.prefix}) : super(key: key);

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          prefix: widget.prefix,
          hintText: widget.text,
          // hintStyle: Style.hintStyle14_400,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.greenAccent, width: 1.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ));
  }
}
