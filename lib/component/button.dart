import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constante_value.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.text,required this.fontSize,required this.width,required this.height, required this.onTap});
  final String text;
  double fontSize;
  double width;
  double height;

  final VoidCallback onTap;

  TextStyle textStyle=const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      wordSpacing: 3,
      letterSpacing: 1);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorApp, //Color(0xff2f52f6),
          padding:const  EdgeInsets.only(top: 10, bottom: 15,left: 10,right: 10),
          elevation: 15,
          side: BorderSide(color: colorBorder,width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onTap,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  wordSpacing: 3,
                  letterSpacing: 2
                )

        ),
      ),
    );
  }
}
