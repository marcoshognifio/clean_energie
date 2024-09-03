import 'package:clean_energie/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/button.dart';
import '../component/component.dart';
import '../component/constante_value.dart';

class Objects {

  void showCustomOverlay(BuildContext context){

    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
              width: 600,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.blue,width: 3)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed:() {
                          overlayEntry.remove();
                        },
                        icon: const Icon(Icons.close_rounded)
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: 500,
                        height: 300,
                        child: GridView.builder(

                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Nombre de colonnes
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: listObjects.length,
                          itemBuilder: (BuildContext context, int index) {
                            return objectWidget(context,index);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);
  }

  Widget objectWidget(BuildContext context,int index){

    return   IconButton(

        onPressed: () {
          showCustomOverlayEntry(context,index);
        },
        icon: Card(
          color: Colors.white,
          elevation: 8,
          child :Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(listObjects[index]['image'],
            ),
          ),
        )
    );
  }



  void showCustomOverlayEntry(BuildContext context,int index){

      final overlayState = Overlay.of(context);
      late OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(
        builder: (context) => Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child:ScrollPage(index: index,overlayEntry: overlayEntry,),
          ),
        ),
      );

      overlayState.insert(overlayEntry);
    }

}

class ScrollPage extends StatefulWidget {
  ScrollPage({super.key,required this.index,required this.overlayEntry});
  int index;
  final PageController pageController = PageController();
  int currentPage = 0;
  OverlayEntry overlayEntry;


  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {

  final PageController pageController = PageController();
  List<Widget> pages = [];
  int currentIndex = 0;
  KeepIndex keepIndex = KeepIndex(0);

  @override
  void initState() {
    super.initState();
    keepIndex = KeepIndex(widget.index);
    pages = [ GetInfoObject(object:  listObjects[keepIndex.value]),
      GetInfoObject(object:  listObjects[keepIndex.value+1]),
      //GetInfoObject(object:  listObjects[keepIndex.value+2])
    ];
  }

  void onPageChanged(int index) {

    setState(() {
      currentIndex = index;

    });
  }

  void goToNextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_ ){
        setState(() {
          pages.removeAt(0);
          pages.add(GetInfoObject(object:  listObjects[keepIndex.value++]));
          pageController.jumpToPage(0);

        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 550,
        height: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
            border: Border.all(color: Colors.blue,width: 3)
        ),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:30.0),
              child: Text("Données de l'appareil/Equipement",
                style: GoogleFonts.kanit(textStyle: TextStyle(
                    color: colorApp,
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                )),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                    return pages[index];
                    },
                  ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:Padding(
                padding: const EdgeInsets.only(right: 20.0,bottom: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    Button(text: 'Annuler',fontSize: 15,width: 100,height: 40,
                      onTap: () async {widget.overlayEntry.remove();},
                    ),

                    const Spacer(),

                    Button(text: 'Valider',fontSize: 15,width: 100,height: 40,
                        onTap: () {
                          Navigator.of(context).pop();
                        }
                    ),

                    const Spacer(),

                    Button(text: 'Suivant',fontSize: 15,width: 100,height: 40,
                        onTap: () {
                          goToNextPage();
                        }
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );

  }
}





class GetInfoObject extends StatefulWidget {
  GetInfoObject({super.key,required this.object});
  Map object;

  @override
  State<GetInfoObject> createState() => _GetInfoObjectState();
}

class _GetInfoObjectState extends State<GetInfoObject> {
  final formKey = GlobalKey<FormState>();
  final objectNameController = TextEditingController();
  final powerController = TextEditingController();
  final yieldController = TextEditingController();
  final cofStartController = TextEditingController();
  final diurnalDurationController = TextEditingController();
  final nightDurationController = TextEditingController();
  final quantityController = TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    objectNameController.dispose();
    powerController.dispose();
    yieldController.dispose();
    cofStartController.dispose();
    diurnalDurationController.dispose();
    nightDurationController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    objectNameController.text =widget.object['name'];
    return  Row(
      children: [
        Card(
          margin: const EdgeInsets.all(20),
          color: Colors.white,
          elevation: 4,
          child :Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(widget.object['image'],width: 100,
            ),
          ),
        ),
        Expanded(
          child: Column(
                children: [
                  entryField('Nom & Model:', 'text', RegExp(r''), objectNameController, true,null, '',20,200),
                  entryField('Puissance:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), powerController, true,'(W)', '',20,200),
                  entryField('Rendement:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), yieldController, true,null, '',20,200),
                  entryField('Coef démarrage:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), cofStartController, true,null, '',20,200),
                  entryField('Duré Diurne:', 'text', RegExp(r'^[0-9]+$'), diurnalDurationController, true,'(H)', '',20,200),
                  entryField('Durée nocturne:', 'text', RegExp(r'^[0-9]+$'), nightDurationController, true,'(H)', '',20,200),
                  entryField('Quantité:', 'text', RegExp(r'^[0-9]+$'), quantityController, true,null, '',20,200),
                ],
          ),
        ),
      ],
    );
  }
}

class ChangeListData with ChangeNotifier {
  List<List> _data;
  ChangeListData(this._data);
  List<List> get data => _data;
  set data(List<List> newList){
    _data = newList;
    notifyListeners();
  }

  addData(List newData){
    _data.add(newData);
    notifyListeners();
  }
}

 ChangeListData notifier = ChangeListData([]);
