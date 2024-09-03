import 'package:flutter/material.dart';

class MyAppA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicPageViewWithButton(),
    );
  }
}


class DynamicPageViewWithButton extends StatefulWidget {
  @override
  _DynamicPageViewWithButtonState createState() => _DynamicPageViewWithButtonState();
}

class _DynamicPageViewWithButtonState extends State<DynamicPageViewWithButton> {
  final PageController _pageController = PageController();
  List<Widget> _pages = [];
  int _currentIndex = 0;
  int _pageCounter = 1; // Compteur pour suivre le numéro des pages

  @override
  void initState() {
    super.initState();
    // Initialiser les deux premières pages
    _pages = [buildPage(_pageCounter++), buildPage(_pageCounter++)];
  }

  Widget buildPage(int index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text(
          'Page $index',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index; // Met à jour l'index actuel pour le suivi
    });
  }

  void _goToNextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {

        setState(() {
          _pages.removeAt(0);
          _pages.add(buildPage(_pageCounter++));
          _pageController.jumpToPage(0);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
        ),
        ElevatedButton(
          onPressed: _goToNextPage,
          child: Text('Page Suivante'),
        ),
      ],
    );
  }
}