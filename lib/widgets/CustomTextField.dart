import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
   Customtextfield({super.key,required this.text,required this.controller,this.maxline=1});
  String? text;
  int maxline;
  final controller;

CustomBorder(Color color){
  return OutlineInputBorder( // Default border
    borderSide: BorderSide(color: color, width: 1),
    borderRadius: BorderRadius.circular(15),
  );
}
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is Required";
          } else {
            return null;
          }
        },
      maxLines: maxline,
        decoration: InputDecoration(
          hintText: text,
          border: CustomBorder(Colors.white),
          enabledBorder: CustomBorder(Colors.white),
          focusedBorder: CustomBorder(Colors.greenAccent),
        ));
  }
}
