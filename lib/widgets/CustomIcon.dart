import 'package:flutter/material.dart';

class Customicon extends StatelessWidget {
  const Customicon({super.key,this.icon,required this.onpress});
final icon;
final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Color(0xff000119),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(onPressed: onpress, icon: Icon(icon,size: 30,color: Colors.white,)),
    );
  }
}
