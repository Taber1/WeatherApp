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
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    cardd(
                      "${snapshot.data.temp1}°C",
                      "${snapshot.data.name1}",
                      "${DateFormat("h:mma").format(snapshot.data.date1)}",
                      "${snapshot.data.main1}",
                      "${snapshot.data.icon1}",
                    ),
                    cardd(
                      "${snapshot.data.temp2}°C",
                      "${snapshot.data.name2}",
                      "${DateFormat("h:mma").format(snapshot.data.date2)}",
                      "${snapshot.data.main2}",
                      "${snapshot.data.icon2}",
                    ),
                    cardd(
                      "${snapshot.data.temp3}°C",
                      "${snapshot.data.name3}",
                      "${DateFormat("h:mma").format(snapshot.data.date3)}",
                      "${snapshot.data.main3}",
                      "${snapshot.data.icon3}",
                    ),
                    cardd(
                      "${snapshot.data.temp4}°C",
                      "${snapshot.data.name4}",
                      "${DateFormat("h:mma").format(snapshot.data.date4)}",
                      "${snapshot.data.main4}",
                      "${snapshot.data.icon4}",
                    ),
                    cardd(
                      "${snapshot.data.temp5}°C",
                      "${snapshot.data.name5}",
                      "${DateFormat("h:mma").format(snapshot.data.date5)}",
                      "${snapshot.data.main5}",
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

Widget cardd(tem, c, d, m, i) {
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
            Text(d, style: TextStyle(color: Colors.white)),
            Text(m, style: TextStyle(color: Colors.white)),
            Image.network('http://openweathermap.org/img/w/${i}.png')
          ],
        )),
  );
}
