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


  GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
  final objectNameController = TextEditingController();
  final powerController = TextEditingController();
  final yieldController = TextEditingController();
  final cofStartController = TextEditingController();
  final diurnalDurationController = TextEditingController();
  final nightDurationController = TextEditingController();
  final quantityController = TextEditingController();

  late Widget page;
  final PageController pageController = PageController();
  int currentIndex = 0;
  KeepIndex keepIndex = KeepIndex(0);

  @override
  void initState() {
    super.initState();
    keepIndex = KeepIndex(widget.index);
    setState(() {
      page = getInfoObject(listObjects[keepIndex.value]);
    });

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
    print("building");
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
                child: page ,
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

                          notifier.addData(getData());
                          setState(() {
                            keepIndex.value++;
                            page = getInfoObject(listObjects[keepIndex.value]);
                            powerController.clear();
                            yieldController.clear();
                            nightDurationController.clear();
                            diurnalDurationController.clear();
                            quantityController.clear();
                            cofStartController.clear();
                          });

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

   Widget getInfoObject(Map object){

      objectNameController.text =object['name'];
      return Row(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            color: Colors.white,
            elevation: 4,
            child :Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(object['image'],width: 100,
              ),
            ),
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  entryField('Nom & Model:', 'text', RegExp(r''),objectNameController, true,null, '',20,200),
                  entryField('Puissance:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), powerController, true,'(W)', '',20,200),
                  entryField('Rendement:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), yieldController, true,null, '',20,200),
                  entryField('Coef démarrage:', 'text', RegExp(r'^[0-9]+{\.}?[0-9]+$'), cofStartController, true,null, '',20,200),
                  entryField('Duré Diurne:', 'text', RegExp(r'^[0-9]+$'), diurnalDurationController, true,'(H)', '',20,200),
                  entryField('Durée nocturne:', 'text', RegExp(r'^[0-9]+$'), nightDurationController, true,'(H)', '',20,200),
                  entryField('Quantité:', 'text', RegExp(r'^[0-9]+$'), quantityController, true,null, '',20,200),
                ],
              ),
            ),
          ),
        ],
      );
  }

  getData(){
    List data = [
      objectNameController.text,
      int.parse(quantityController.text),
      int.parse(powerController.text),
      int.parse(yieldController.text),
      int.parse(diurnalDurationController.text),
      int.parse(nightDurationController.text),
      int.parse(cofStartController.text),
    ];
    return data;
  }
}


List<Widget> listDataColumn(List items){
  TextStyle columnStyle = const TextStyle(
    fontFamily: "Oswald-Light",
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    wordSpacing: 3,
  );
  List<Widget> result=[];
  for(int i=0,a=items.length;i<a;i++){
    result.add(  Text(items[i],
            style: columnStyle,
          textAlign: TextAlign.center,
        )
    );
  }

  return result;
}

Map<int, TableColumnWidth> columnHeadWidth(List items){

  Map<int, TableColumnWidth> result = {};
  for(int i=0,c=items.length;i<c;i++){
    result[i] = const FlexColumnWidth(1);
  }
  return result;
}


class ChangeListData with ChangeNotifier {

  List<List>dataList =[];
  List<List<int>> dataPowerEnergy =[[],[]];
  int totEnergy = 0;
  int totPower = 0;
  int number = 0;
  ChangeListData(this.dataList);

  totalPower(){
    for(int i=0,c=dataPowerEnergy[0].length;i<c;i++){
      totPower += dataPowerEnergy[0][i];
    }
    return totPower;
  }
  totalEnergy(){
    for(int i=0,c=dataPowerEnergy[1].length;i<c;i++){
      totEnergy += dataPowerEnergy[1][i];
    }

    return totEnergy;
  }

  addData(List newData){
    dataList.add(newData);
    notifyListeners();
  }
}

 ChangeListData notifier = ChangeListData([]);
