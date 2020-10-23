import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/button.dart';
import 'package:weather_app/forecast.dart';
import 'package:weather_app/weather_model.dart';

class Currentweather extends StatefulWidget {
  final bool value;
  const Currentweather(this.value, {Key key}) : super(key: key);

  @override
  _CurrentweatherState createState() => _CurrentweatherState();
}

class _CurrentweatherState extends State<Currentweather> {
  Future<Weather> weatherData;
  bool val = false;

  @override
  void initState() {
    super.initState();
    weatherData =
        (val == widget.value ? load_data("Karachi") : searchweather(abc));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Buttonn()));
              },
            )
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //   image: DecorationImage(
            //       colorFilter: new ColorFilter.mode(
            //           Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //       image: AssetImage("assets/images/background.jpg"),
            //       fit: BoxFit.cover),

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.yellow[600], Colors.orange, Colors.red])),
        child: FutureBuilder<Weather>(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${snapshot.data.temp} °C",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    snapshot.data.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data.main,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.network(
                          'http://openweathermap.org/img/w/${snapshot.data.icon}.png')
                    ],
                  ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Buttonn()));
                  //   },
                  //   child: Text("Search By City"),
                  // ),
                  SizedBox(height: 20),
                  Forect(widget.value),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Text(" ");
          },
        ),
      ),
    );
  }
}
