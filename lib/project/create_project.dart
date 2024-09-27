import 'package:clean_energie/component/constante_value.dart';
import 'package:clean_energie/data/data.dart';
import 'package:flutter/material.dart';
import '../component/button.dart';
import '../component/get_list.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {

  final formKey = GlobalKey<FormState>();
  final projectNameController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final clientController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final clientAddressController = TextEditingController();
  final emailController = TextEditingController();
  final managerProjectController = TextEditingController();
  late GetList getType;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    projectNameController.dispose();
    dateController.dispose();
    placeController.dispose();
    clientController.dispose();
    phoneNumberController.dispose();
    clientAddressController.dispose();
    emailController.dispose();
    managerProjectController.dispose();


  }

  Future saveProject()async{

    if (formKey.currentState!.validate()) {

      Map<String,dynamic> project = {
        'nom' : projectNameController.text,
        'date' : dateController.text,
        'lieu' : placeController.text,
        'type' : listTypeProject[getType.selectedValue!-1]['label'],
        'client' : clientAddressController.text,
        'adresse' : clientAddressController.text,
        'telephone' : phoneNumberController.text,
        'email' : emailController.text,
        'manager' : managerProjectController.text
      };

      await DatabaseHelper().addProject(project);

      Navigator.pushNamed(context, '/result_project');
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
               width: 600,
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
                         padding: const EdgeInsets.only(top:20.0),
                         child: Text('INFORMATION SUR LE PROJET',
                           style: TextStyle(
                             fontFamily: 'Kanit-Bold',
                             color: colorApp,
                             fontWeight: FontWeight.bold,
                             fontSize: 23
                           ),
                          ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Form(
                             key: formKey,
                             child: Column(
                               children: [
                                 entryField('Nom du projet',
                                     'text',
                                     RegExp(r''),
                                     projectNameController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Date',
                                     'date',
                                     RegExp(r''),
                                     dateController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Lieu',
                                     'text',
                                     RegExp(r''),
                                     placeController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),
                                 getType =  GetList(text: 'Type d\'application',items: listTypeProject,),

                                 entryField('Client',
                                     'text',
                                     RegExp(r''),
                                     clientController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Adresse du Client',
                                     'text',
                                     RegExp(r''),
                                     clientAddressController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Téléphone',
                                     'text',
                                     RegExp(r''),
                                     phoneNumberController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Email',
                                     'text',
                                     RegExp(r'^[a-zA-Z0-9]+\@{1}[a-z]+\.{1}[a-z]+$'),
                                     emailController,
                                     false,
                                     'Ce champ est obligatoire'
                                 ),

                                 entryField('Projet suivi par',
                                     'text',
                                     RegExp(r''),
                                     managerProjectController,
                                     false,
                                     'Ce champ est obligatoire'
                                 )
                               ],
                             )
                         ),
                       )

                     ],
                   ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:  20.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            Button(text: 'Enregistrer',fontSize: 20,width: 200,height: 40,backgroundColor: colorApp, onTap: () async {
                              await saveProject();
                            },),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Button(text: 'Annuler',fontSize: 20,width: 200,height: 40,backgroundColor: colorApp, onTap: () {
                                Navigator.of(context).pop();
                              },),
                            ),
                        const Spacer()
                          ],
                        ),
                      ),
                    )
                 ],
               ),

             ),
           ),
         ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0,horizontal:  20),
              child: Text('IA\nSolarCALC',
                style: TextStyle(
                  fontFamily: 'Oswald-Light',
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget entryField(String text,String type,RegExp express,TextEditingController controller,bool required,String error){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(text,style: const TextStyle(
                  fontFamily: 'Kanit-Bold',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )
            ),
          ),
          SizedBox(
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
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.white,
                   contentPadding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            width: 1,
                            color: colorBorder
                        ),
                    ),

                 enabledBorder: OutlineInputBorder(
                   borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
