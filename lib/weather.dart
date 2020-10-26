import 'dart:async';
import 'dart:ui';
import 'dart:math';
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
//  int randomNumber = Random().nextInt(6) + 1;

  @override
  void initState() {
    super.initState();
    weatherData = (val == widget.value ? load_data("Karachi") : load_data(abc));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: weatherData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // if (snapshot.data.main == 'clear') {
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
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.dstATop),
                        image: AssetImage(
                            "assets/images/${Random().nextInt(6) + 1}.jpg"),
                        fit: BoxFit.cover),
                  ),

                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     colors: [Colors.yellow[600], Colors.orange, Colors.red])),
                  child:
                      Stack(alignment: Alignment(0.0, 0.65), children: <Widget>[
                    Positioned(
                        top: 100,
                        left: 5,
                        child: Container(
                            height: 200,
                            width: 200,
                            child: maincard(
                              "${snapshot.data.temp}°C",
                              "${snapshot.data.name}",
                              "${snapshot.data.main}",
                              "${snapshot.data.icon}",
                            ))),
                    Forect(widget.value)
                  ])));
          // }
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Text(" ");
      },
    );
  }
}

Widget maincard(temp, name, main, icon) {
  return Container(
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
              'http://openweathermap.org/img/w/$icon.png',
              height: 100,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 82,
            left: 30,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  temp,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  main,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
