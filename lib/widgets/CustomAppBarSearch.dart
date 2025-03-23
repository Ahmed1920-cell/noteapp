import 'package:flutter/material.dart';
import 'package:noteapp/widgets/CustomIcon.dart';

class CustomAppbarSearch extends StatelessWidget {
  CustomAppbarSearch({super.key,this.text,this.controller,this.onChange,this.hint,this.OnPress});
  String? text;
   String? hint;
  final controller;
  final onChange;
   final void Function()? OnPress;
  CustomBorder(Color color){
    return OutlineInputBorder( // Default border
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(15),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text!, style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),),
    SizedBox(
      height: 50,
      width: 200,
      child: TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
      hintText: hint,
      suffixIcon: Customicon(onpress: OnPress,icon: Icons.close,
      ),
      border: CustomBorder(Colors.white),
      enabledBorder: CustomBorder(Colors.white),
      focusedBorder: CustomBorder(Colors.greenAccent),
      )),
    ),
      ],
    );
  }
}
