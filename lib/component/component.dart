import 'package:flutter/material.dart';
import 'constante_value.dart';

Widget entryField(String text,String type,RegExp express,TextEditingController controller,bool required,String? suffix,String error,double fontSize,double width){
  return Padding(
    padding: const EdgeInsets.only(bottom: 20,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(text,style:TextStyle(
                  fontFamily: 'Kanit-Bold',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize
              )
          ),
        ),
        Container(
          height: 30,
          width: width,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if(required == true )
              {
                if(value!.isEmpty){
                  return 'Ce champ est obligatoire';
                }
                if (!express.hasMatch(value))
                {
                  return error;
                }
                return null;
              }
              else
              {
                if (value!.isNotEmpty && !express.hasMatch(value))
                {
                  return error;
                }
                else {
                  return null;
                }
              }
            },
            decoration:  InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hoverColor: Colors.white,
                contentPadding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                suffixIcon: suffix !=null ? Text(suffix,style: const TextStyle(color: Colors.black),):null,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      width: 1,
                      color: colorBorder
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      width: 1,
                      color: colorBorder
                  ),
                )
            ),
            style: TextStyle(
                color: colorProject,
                fontSize: 17
            ),
          ),

        )
      ],
    ),
  );
}