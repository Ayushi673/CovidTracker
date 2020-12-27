import 'package:flutter/material.dart';
import 'package:covid19/models/countryModel.dart';
import 'package:covid19/services/countrydataService.dart';
class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  List<CountryModel> _countryModel;

  @override
  void initState() {
    super.initState();
    WorldData.getData().then((value) {
      setState(() {
        _countryModel=value;
      });
    });
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: null==_countryModel?0:_countryModel.length,
          itemBuilder: (context,index){
            CountryModel cntry=_countryModel[index];
            return Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.green.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(cntry.country, style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total deaths: ${cntry.deaths}'),
                                Text('Today deaths: ${cntry.todayDeaths}'),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Active: ${cntry.active}'),
                                Text('Recovered: ${cntry.recovered}'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
