import 'package:clean_energie/component/constante_value.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/button.dart';
import '../data/data.dart';
import 'objects.dart';

class ResultProject extends StatefulWidget {
  const ResultProject({super.key});

  @override
  State<ResultProject> createState() => _ResultProjectState();
}

class _ResultProjectState extends State<ResultProject> {

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future saveProject()async{

    if (formKey.currentState!.validate()) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    color: colorApp
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/RESSOURCES1/project.jpeg'),
                          fit: BoxFit.cover)
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 900,
                height: 700,
                decoration: BoxDecoration(
                    color: const Color(0xFFBDD7EE).withOpacity(0.78),
                    border: Border.all(color: colorBorder,width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:20.0,bottom: 20),
                          child: Text('BILAN DES CHARGES',
                            style: TextStyle(
                                fontFamily: 'Kanit-Bold',
                                color: colorApp,
                                fontWeight: FontWeight.bold,
                                fontSize: 23
                            ),
                          ),
                        ),
                        DataTable(
                          border: TableBorder.all(
                              width: 2,
                              color: Colors.white,
                          ),
                          headingRowColor: WidgetStateColor.resolveWith((states) => colorApp),
                          headingTextStyle: const TextStyle(
                            fontFamily: "Oswald-Light",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            wordSpacing: 3,
                          ),
                          columns:listDataColumn(listColumn),
                          rows: const []
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:  20.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            Button(text: 'Ajouter manuellement les données',fontSize: 13,width: 200,height: 50,
                              onTap: () async {
                                await saveProject();
                              }
                            ),

                            const Spacer(),

                            Button(text: 'Sélectionner les données',fontSize: 13,width: 170,height: 50,
                              onTap: () async {
                                Objects().showCustomOverlay(context);
                              }
                            ),

                            const Spacer(),

                            Button(text: 'Lancer le bilan',fontSize: 13,width: 170,height: 50, onTap: () {
                              Navigator.of(context).pop();
                            },),

                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed:() {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close_rounded)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> listDataColumn(List items){
    TextStyle columnStyle = const TextStyle(
      fontFamily: "Oswald-Light",
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      wordSpacing: 3,
    );
    List<DataColumn> result=[];
    for(int i=0,a=items.length;i<a;i++){
      result.add( DataColumn(
          headingRowAlignment: MainAxisAlignment.start,
          label: Text(items[i],
              style: columnStyle
          )
      ),);
    }

    return result;
  }

  Widget entryField(String text,String type,RegExp express,TextEditingController controller,bool required,String error){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,),
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
            height: 30,
            width: 300,
            child: TextFormField(
              controller: controller,
              readOnly:  type == 'date'? true:false,
              showCursor: type == 'date'? false:true,
              onTap: type != 'date'? (){}:
                  ()async{
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                controller.text = "${pickedDate?.day}-${pickedDate?.month}-${pickedDate?.year}";
              },
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
}

