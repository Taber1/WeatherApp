import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/forecastmodel.dart';
import 'button.dart';

class Forect extends StatefulWidget {
  final bool value;
  Forect(this.value, {Key key}) : super(key: key);

  @override
  _ForectState createState() => _ForectState();
}

class _ForectState extends State<Forect> {
  Future<Forecast> forecastData;
  bool val = false;

  @override
  void initState() {
    super.initState();
    forecastData =
        (val == widget.value ? forc_data("Karachi") : forc_data(abc));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Forecast>(
        future: forecastData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    cardd(
                      "${snapshot.data.temp1}°C",
                      "${DateFormat("h:mma").format(snapshot.data.date1)}",
                      "${snapshot.data.icon1}",
                    ),
                    cardd(
                      "${snapshot.data.temp2}°C",
                      "${DateFormat("h:mma").format(snapshot.data.date2)}",
                      "${snapshot.data.icon2}",
                    ),
                    cardd(
                      "${snapshot.data.temp3}°C",
                      "${DateFormat("h:mma").format(snapshot.data.date3)}",
                      "${snapshot.data.icon3}",
                    ),
                    cardd(
                      "${snapshot.data.temp4}°C",
                      "${DateFormat("h:mma").format(snapshot.data.date4)}",
                      "${snapshot.data.icon4}",
                    ),
                    cardd(
                      "${snapshot.data.temp5}°C",
                      "${DateFormat("h:mma").format(snapshot.data.date5)}",
                      "${snapshot.data.icon5}",
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Widget cardd(tem, d, i) {
  return Column(
    children: [
      Text(d,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      Container(
        height: 130,
        width: 120,
        child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    'http://openweathermap.org/img/w/${i}.png',
                    height: 100,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 75,
                    left: 30,
                    child: Text(tem,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              ],
            )),
      ),
    ],
  );
}
