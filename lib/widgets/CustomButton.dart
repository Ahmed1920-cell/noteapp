import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
   Custombutton({super.key,required this.text,required this.onTap});
String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.greenAccent.shade200,
        ),
        child: Text("Add", style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
