import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constante_value.dart';

class Button extends StatefulWidget {
  Button({super.key, required this.text,this.fontSize,required this.width,this.height,this.style,this.backgroundColor, required this.onTap});
  final String text;
  final double? fontSize;
  final double width;
  final double? height;
  final VoidCallback onTap;
  final TextStyle? style;
  final Color? backgroundColor;


  TextStyle textStyle=const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      wordSpacing: 3,
      letterSpacing: 1);
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor, //Color(0xff2f52f6),
          padding:const  EdgeInsets.only(top: 10, bottom: 15,left: 10,right: 10),
          elevation: 15,
          side: BorderSide(color: _isClicked ? Colors.yellow:colorBorder,width: _isClicked ? 3:1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: ()async{
          //await _handleClick();
          widget.onTap();
        },
        child: Text(widget.text,
            textAlign: TextAlign.center,
            style: widget.style ?? TextStyle(
                color: Colors.white,
                fontSize: widget.fontSize,
                wordSpacing: 3,
                letterSpacing: 2
            )

        ),
      ),
    );
  }

  Future<void> _handleClick() async {

    setState(() {
      _isClicked = true;
    });

    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _isClicked = false;
      });
    });

    await Future.delayed(const Duration(milliseconds: 100));
  }
}


