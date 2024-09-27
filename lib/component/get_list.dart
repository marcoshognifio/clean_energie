import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constante_value.dart';

//ignore: must_be_immutable
class GetList extends StatelessWidget {
  GetList({super.key,required this.text,required this.items});
  String text;
  final List<Map<String,dynamic>> items ;
  int?  selectedValue;

  getSelectedValue(){
    if(selectedValue == null){
      return -1;
    }
    return  selectedValue;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Expanded(
          child: Text(text,style: GoogleFonts.kanit(
          textStyle:const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ))
            ),
        ),
      Container(
        width: 300,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
              decoration:  InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.white,
                  filled: true,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 1,
                          color: colorBorder
                      )
                  ),
              ),
              value: selectedValue,
              hint: const Text("Choisissez le projet "),
              items: listItems(items),
              onChanged: (int? value) {
                if(value != null){
                  selectedValue = value;
                }
              },
              validator: (value) {
                if (value == null ) {
                  selectedValue = items[0]['value'];
                }
                return null;
              }
          ),
        ),
        ),
      ]
      ),
    );
  }

  List<DropdownMenuItem<int>> listItems(List<Map<String,dynamic>> list)
  {
    List<DropdownMenuItem<int>> result = [];
    for(int i=0,c = list.length;i<c;i++){
      result.add(DropdownMenuItem(value: list[i]["value"],
          child:SizedBox(
              height: 20,
              child: Text(list[i]["label"]))
          )
      );
    }
    return result;
  }
}
