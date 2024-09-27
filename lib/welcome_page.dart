import 'package:clean_energie/component/button.dart';
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
              child:  Button(
                text: 'CREER NOUVEAU PROJET',
                width: 200,
                height: 50,
                style: TextStyle(
                  fontFamily: "Oswald-Bold",
                  color: colorApp,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 3,
                ),
                backgroundColor: colorButton,
                onTap:(){
                    Navigator.pushNamed(context, '/new_project');
                  }
              ),
            ),

            Button(
                text: 'OUVRIR UN PROJET',
                style: TextStyle(
                  fontFamily: "Oswald-Bold",
                  color: colorApp,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 3,
                ),
                backgroundColor: colorButton,
                width: 200,
                height: 50,
                onTap:(){
                  Navigator.pushNamed(context, '/new_project');
                }
            ),
            const Spacer(),
            Image.asset('assets/RESSOURCES1/solar-ai.png',width: 200,)
          ],
        ),
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


