import 'package:flutter/material.dart';
import 'package:weather_app/api.dart';
<<<<<<< HEAD
import 'package:weather_app/forecastmodel.dart';

import 'package:weather_app/forecastmodel.dart';
=======

import 'package:weather_app/weather_model.dart';
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4

class Forect extends StatefulWidget {
  @override
  _ForectState createState() => _ForectState();
}

class _ForectState extends State<Forect> {
<<<<<<< HEAD
  Future<Forecast> ac;
=======
  Future<Weather> wea;
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4

  @override
  void initState() {
    super.initState();

<<<<<<< HEAD
    ac = forc_data() ;
=======
    wea = load_data();
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
  }

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      child: FutureBuilder<Forecast>(
        future: ac,
=======
      child: FutureBuilder<Weather>(
        future: wea,
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
<<<<<<< HEAD
                        cardd("${snapshot.data.temp1}", "${snapshot.data.name1}",
                        "${snapshot.data.main1}", "${snapshot.data.date1}"),
                        cardd("${snapshot.data.temp2}", "${snapshot.data.name2}",
                        "${snapshot.data.main2}", "${snapshot.data.date2}"),
                        cardd("${snapshot.data.temp3}", "${snapshot.data.name3}",
                        "${snapshot.data.main3}", "${snapshot.data.date3}"),
                        cardd("${snapshot.data.temp4}", "${snapshot.data.name4}",
                        "${snapshot.data.main4}", "${snapshot.data.date4}"),
                        cardd("${snapshot.data.temp5}", "${snapshot.data.name5}",
                        "${snapshot.data.main5}", "${snapshot.data.date5}"),
=======
                    cardd("${snapshot.data.temp}", snapshot.data.name,
                        snapshot.data.main, "${snapshot.data.icon}"),
                    cardd("${snapshot.data.temp}", snapshot.data.name,
                        snapshot.data.main, "${snapshot.data.date}"),
                    cardd("${snapshot.data.temp}", snapshot.data.name,
                        snapshot.data.main, "${snapshot.data.date}"),
                    cardd("${snapshot.data.temp}", snapshot.data.name,
                        snapshot.data.main, "${snapshot.data.date}"),
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
                  ],
                ),
              ),
            );
<<<<<<< HEAD
        } else if (snapshot.hasError) {
=======
          } else if (snapshot.hasError) {
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Widget cardd(tem, c, m, d) {
  return Container(
    height: 130,
    width: 120,
    child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tem, style: TextStyle(color: Colors.white)),
            Text(c, style: TextStyle(color: Colors.white)),
            Text(m, style: TextStyle(color: Colors.white)),
            Text(d, style: TextStyle(color: Colors.white)),
          ],
        )),
  );
}
