import 'package:flutter/material.dart';

import 'CustomIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,this.text,this.icon,required this.OnPress});
final text;
final icon;
final void Function()? OnPress;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),),
        Customicon(icon: icon,onpress: OnPress,),
      ],
    );
  }
}
