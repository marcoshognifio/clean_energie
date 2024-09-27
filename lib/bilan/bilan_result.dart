import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../component/button.dart';
import '../component/constante_value.dart';
import '../data/data.dart';
import 'objects.dart';

class BilanResult extends StatefulWidget {
  const BilanResult({super.key});

  @override
  State<BilanResult> createState() => _BilanResultState();
}

class _BilanResultState extends State<BilanResult> {
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
            child: Container(
              width: 1150,
              height: 750,
              decoration: BoxDecoration(
                  color: const Color(0xFFBDD7EE).withOpacity(0.78),
                  border: Border.all(color: colorBorder,width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 50.0,bottom: 10, left: 30,right: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 500,
                          padding: const EdgeInsets.only(left: 10, top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            color: colorRow[1],
                            border: Border.all(color: colorBorder)
                          ),
                          child:Row(
                            children: [
                              Text('Nom Projet',
                                  style: TextStyle(
                                    color: colorApp,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    wordSpacing: 3,
                                  )
                              ),
                              Container(
                                width: 100,
                                height: 35,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: colorBorder)
                                ),
                                child: Center(child: Text('CEFA',
                                    style: TextStyle(
                                        color: colorProject,
                                        fontSize: 17
                                    ),
                                ),),
                              ),
                              Container(width: 50,),
                              Text('Num Projet',
                                  style: TextStyle(
                                    color: colorApp,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    wordSpacing: 3,
                                  )
                              ),
                              Container(
                                width: 100,
                                height: 35,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: colorBorder)
                                ),
                                child:Center(child: Text('001',
                                    style: TextStyle(
                                        color: colorProject,
                                        fontSize: 17
                                    ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text('BILAN DES CHARGES',
                          style: TextStyle(
                              fontFamily: 'Kanit-Bold',
                              color: colorApp,
                              fontWeight: FontWeight.bold,
                              fontSize: 23
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 20.0,bottom: 20, left: 30,right: 30),
                    child: Table(
                      border: TableBorder.all(color: Colors.white),
                      columnWidths: columnHeadWidth(listColumnBilan),
                      children: listDataRow(listColumnBilan, notifier.dataList),
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(left: 30,right: 30),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Expanded(
                         child: Column(
                                children: [
                                  Table(
                                    border: TableBorder.all(color: Colors.white),
                                    columnWidths: const<int,TableColumnWidth>{0:FlexColumnWidth(1)},
                                    children: [
                                      TableRow(
                                          children: [
                                            Center(child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text('RESUME DU BILAN ENERGETIQUE',
                                                style: TextStyle(
                                                  fontFamily: "Oswald-Normal",
                                                  color: colorApp,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  wordSpacing: 3,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),),
                                          ]
                                      ),
                                      TableRow(
                                        children: [
                                          Table(
                                            border: TableBorder.all(color: Colors.white), // Ajoute des bordures autour des cellules
                                            columnWidths: const <int, TableColumnWidth>{
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(1),
                                              2: FlexColumnWidth(1),
                                            },
                                            children: [
                                              TableRow(
                                                decoration: BoxDecoration(
                                                    color: colorApp
                                                ),
                                                children: [
                                                  columnItem('PUISSANCE TOTALE'),
                                                  columnItem('ENERGIE TOTALE'),
                                                  columnItem('ENERGIE TOTALE CORRIGEE')
                                                ]
                                              ),
                                              TableRow(
                                                decoration: BoxDecoration(
                                                  color: colorRow[1]
                                                ),

                                                children: [
                                                  Center(child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text('${notifier.totalPower()} Watts',style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17
                                                    ),),
                                                  )),
                                                  Center(child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text('${notifier.totalEnergy()} Wh',style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17
                                                    )),
                                                  )),
                                                  Center(child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text('${notifier.totEnergy/1000} KWH',style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17
                                                    )),
                                                  ))
                                                ]
                                              )
                                            ],
                                          )
                                        ]
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Row(
                                      children: [
                                        Button(text: 'IMPRIMER Le BILAN',fontSize: 13,width: 200,height: 50,
                                            onTap: () async {
                                            }
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:30.0),
                                          child: Button(text: 'AJUSTER LES PARAMETRE DE DIEMENSIONNEMENT',fontSize: 13,width: 200,height: 50,
                                              onTap: () async {
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],

                          ),
                       ),
                       Container(
                         margin: const EdgeInsets.only(left: 30),
                         width: 550,
                         height: 400,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black)
                         ),
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           children: [
                             const Center(
                               child: Text('Profil des Charges',style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20
                               ),),
                             ),
                             Container(
                                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                                  color: Colors.white,
                                  width: 450,
                                  height: 250,
                                 child: profileCharge()
                             ),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(width: 10,height: 10,margin: const EdgeInsets.only(right:10),color: colorBorder),
                                 const Text('Puissance (W)',style: TextStyle(
                                   fontSize: 17,
                                   fontWeight: FontWeight.w500
                                 ),),
                                 Container(width: 30,),
                                 Container(width: 10,height: 10,margin: const EdgeInsets.only(right:10),color: colorBar1),
                                 const Text('Energie (Wh)',style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w500
                                 )),
                               ],
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                 ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget columnItem(String text){
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
        style: const TextStyle(
          fontFamily: "Oswald-Normal",
          color: Colors.white,
          fontSize: 15,
          wordSpacing: 3,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
 

  List<TableRow> listDataRow(List headItems,List<List> items) {
    List<TableRow> result = [];
    notifier.dataPowerEnergy[0] = [];
    notifier.dataPowerEnergy[1] = [];

    TextStyle style = const TextStyle(
    fontFamily: "Oswald-Normal",
    color: Colors.black,
    fontSize: 17,
    wordSpacing: 3,
    );

    result.add(
      TableRow(
          decoration: BoxDecoration(
            color: colorApp
          ),
          children: headItems.map((item) => Center(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(item,
                style: const TextStyle(
                  fontFamily: "Oswald-Normal",
                  color: Colors.white,
                  fontSize: 17,
                  wordSpacing: 3,
                ),
              ),
            ),
          ),).toList()
      ),
    );

    for (int i = 0, c = items.length; i < c; i++) {
      List<Widget> listWidget = [];
      listWidget.add(
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: Text('${i + 1}',style: style,),
          ))
      );
      for (int j = 0, a = items[i].length; j < a; j++) {
        listWidget.add(Center(child: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Text('${items[i][j]}',style: style,),
        )));
      }
      int power = items[i][1] * items[i][2],
          t = items[i][4] + items[i][5];

      listWidget.add(Center(child: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: Text('$power W',style: style,),
      )));
      listWidget.add(Center(child: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: Text('${power * t}',style: style,),
      )));
      notifier.dataPowerEnergy[0].add(power);
      notifier.dataPowerEnergy[1].add(power * t);
      result.add(
          TableRow(
              decoration: BoxDecoration(
                color: colorRow[i%2]
              ),
              children: listWidget
          )
      );
    }
    return result;
  }

  BarChart profileCharge(){

    int maxEnergy = notifier.dataPowerEnergy[1].reduce((a, b) => a > b ? a : b);
    maxEnergy = roundToNearestTen(maxEnergy*1.0);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxEnergy*1.0,
        titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false
              )
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 30,
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  );
                  for(int i=0,c=notifier.dataPowerEnergy[1].length;i<c;i++){
                    if(value.toInt() == i ){
                      return Padding(
                        padding: const EdgeInsets.only(top :10.0),
                        child: Text(notifier.dataList[i][0], style: style),
                      );
                    }
                  }
                  return const Text('');

                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            )
        ),
        barGroups: listBar([notifier.dataPowerEnergy[0],notifier.dataPowerEnergy[1]]),
      ),
    );
  }


}

List<BarChartGroupData> listBar(List<List> items){

  List<BarChartGroupData> result = [];

  for(int i=0,c=items[0].length;i<c;i++){
    result.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: 1.0*items[0][i],
            color: colorBorder,
            width: 25,
            borderRadius: const BorderRadius.all(Radius.zero)
          ),
          BarChartRodData(
            toY: 1.0*items[1][i],
            color: const Color(0xFFed7d31),
            width: 25,
            borderRadius: const BorderRadius.all(Radius.zero)
          ),
        ],
      ),
    );
  }


  return result;
}


int roundToNearestTen(double number) {
  return (number / 10).round() * 10;
}

int getInterval(double number){

  int a = (number.truncate()/10).ceil();
  int b = a % 10;
  if(b<5){
    a = a - b;
    a = a + 5;
  }
  else{
    a = a - b;
    a = a + 10;
  }
  return a;
}