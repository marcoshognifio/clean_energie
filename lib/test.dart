import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class MyAppA extends StatelessWidget {

  List<String> item = ['Apple','Orange','Banana'];
  List<int> element = [10,20,50];
  int maxPower = 0;


@override
Widget build(BuildContext context) {

  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Diagramme de Bâton avec fl_chart'),
      ),
      body: Center(
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 1.0*element.reduce((a, b) => a > b ? a : b),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    int c=item.length;
                    for(int i=0;i<c;i++){
                      if(value.toInt() == i ){
                        return Text(item[i], style: style);
                      }
                    }
                    return const Text('');

                  },
                ),
              ),
              leftTitles: AxisTitles(
              sideTitles: SideTitles(
              showTitles: true,
              interval: 2, // Espacement entre les valeurs de l'axe Y
              getTitlesWidget: (double value, TitleMeta meta) {
                if (value % 5 == 0) {
                  return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                }
                return Container();
              },
            ),
          )
            ),
            barGroups:listBar()
          ),
        ),
      )
    ),
  );
  }

  List<BarChartGroupData> listBar(){

    List<BarChartGroupData> result = [];
    for(int i=0,c=element.length;i<c;i++){
      result.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: 1.0*element[i],
              color: Colors.blue,
              width: 15,
            ),
          ],
        ),
      );

    }

    return result;
  }


}