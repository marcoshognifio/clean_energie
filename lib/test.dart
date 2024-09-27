import 'package:flutter/material.dart';


class MyAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bouton avec Délai avant Fonction')),
        body: Center(
          child: CustomButton(onPressed: () {
            // Fonction déclenchée après l'animation
            print("Fonction personnalisée exécutée après l'animation !");
          }),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed; // Fonction passée en argument

  CustomButton({required this.onPressed}); // Constructeur avec la fonction

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isClicked = false;

  void _handleClick() async {
    setState(() {
      _isClicked = true; // Changer l'état à "cliqué"
    });

    // Attendre que l'animation du bouton (2 secondes) soit terminée
    await Future.delayed(Duration(seconds: 2));

    // Exécuter la fonction passée après l'animation
    widget.onPressed();

    // Revenir à l'état initial après avoir exécuté la fonction
    setState(() {
      _isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _isClicked ? Colors.red : Colors.blue, // Changer la couleur pendant l'animation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_isClicked ? 30 : 10), // Changer la forme
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      onPressed: _handleClick, // Utiliser la méthode qui gère le clic
      child: Text(
        _isClicked ? 'Animation...' : 'Cliquez-moi',
        style: TextStyle(
          fontSize: _isClicked ? 20 : 16, // Modifier la taille du texte pendant l'animation
        ),
      ),
    );
  }
}
/*class MyAppA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(title: const Text('Redimensionnement')),
      body: Center(
        child: Container(
          width: screenWidth * 0.8, // 80% de la largeur de l'écran
          height: screenHeight * 0.5, // 50% de la hauteur de l'écran
          color: Colors.blue,
          child: Center(
            child: Text(
              'Texte redimensionné',
              style: TextStyle(
                fontSize: screenWidth * 0.05, // 5% de la largeur de l'écran
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/