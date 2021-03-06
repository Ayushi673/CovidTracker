import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage extends StatefulWidget {
  final Widget child;

  ChartPage({Key key, this.child}) : super(key: key);

  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  List<charts.Series<Task, String>> _seriesPieData;


  _generateData() {

    var piedata = [
      new Task('Deaths',147659, Color(0xff3366cc)),
      new Task('Tests/million', 121233, Color(0xff990099)),
      new Task('Critical', 8944, Color(0xff109618)),
      new Task('Active', 279195, Color(0xfffdbe19)),
      new Task('Cases/million', 58545, Color(0xfffdbe77)),
    ];


    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Covid',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );


  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();

    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(4.0,10,8,8),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'India: Covid-19 Analysis',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 3),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

          ),
        );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

