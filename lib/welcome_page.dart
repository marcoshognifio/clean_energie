import 'package:clean_energie/component/constante_value.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/data.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  @override
  void initState() {
    listObjectsGroup = Group(listObjects);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return const Scaffold(
        body: Row(
          children: [
            LeftSide(),
            RightSide()
          ],
        )
    )
    ;
  }
}


class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        color: colorApp,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text('BIENVENU DANS',
                style: TextStyle(
                    fontFamily: 'OoohBaby',
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 3,
                    fontStyle: FontStyle.italic
                  )
                ,
              ),
            ),
            Text('IA\nSolarCALC',
              style: GoogleFonts.roboto(textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              )),
              textAlign: TextAlign.center,),
            //Text('SolarCALC',style:nameStyle),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: buttonProject('CREER NOUVEAU PROJET', (){
                Navigator.pushNamed(context, '/new_project');
              }),
            ),
            buttonProject('OUVRIR UN PROJET', (){}),
           const  Spacer()
          ],
        ),
      ),
    );
  }

  Widget buttonProject(String text, VoidCallback onTap){

    return SizedBox(
      width: 200,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(

          backgroundColor: colorProject, //Color(0xff2f52f6),
          padding:const  EdgeInsets.only(top: 20, bottom: 20,left: 10,right: 10),
          elevation: 10,
          side: BorderSide(color: colorBorder,width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onTap,
        child: Text(text,
            style: TextStyle(
                  fontFamily: "Oswald-Bold",
                  color: colorApp,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 3,
                )
        )
        ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 300,
        child: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/RESSOURCES1/welcome.jpeg'),
          fit: BoxFit.fill)
    ),
        ),
      ),
    );
  }
}


