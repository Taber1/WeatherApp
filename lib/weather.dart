import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/api.dart';
<<<<<<< HEAD
import 'package:weather_app/button.dart';
import 'package:weather_app/forecast.dart';
import 'package:weather_app/search.dart';
=======
import 'package:weather_app/forecast.dart';
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
import 'package:weather_app/weather_model.dart';

class Currentweather extends StatefulWidget {
  @override
  _CurrentweatherState createState() => _CurrentweatherState();
}

class _CurrentweatherState extends State<Currentweather> {
  Future<Weather> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = load_data();

    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),

          //gradient: LinearGradient(
          //begin: Alignment.topCenter,
          // colors: [Colors.yellow[600], Colors.orange, Colors.red])
        ),
        child: FutureBuilder<Weather>(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
<<<<<<< HEAD
                    "${snapshot.data.temp} °C",
=======
                    "${snapshot.data.temp} *C",
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
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
                  Text(
                    snapshot.data.main,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
<<<<<<< HEAD
                  RaisedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Buttonn()));
                    
                  },
                  child: Text("Searcj By City"),
                  ),
                  SizedBox(height:20),
=======
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
                  Forect(),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

<<<<<<< HEAD
            return Text(" ");
            
=======
            // By default, show a loading spinner.
            return CircularProgressIndicator();
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
          },
        ),
      ),
    );
  }
}
