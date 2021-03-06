import 'package:http/http.dart' as http;
import 'package:weather_app/forecastmodel.dart';
import 'dart:async';
import 'package:weather_app/weather_model.dart';
import 'dart:convert';

Future<Weather> load_data(city) async {
  //String city;
  final weatherResponse = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=10530cd042fdda8d65051ca864fc86bf');
  if (weatherResponse.statusCode == 200) {
    return Weather.fromJson(jsonDecode(weatherResponse.body));
  } else {
    throw Exception('Failed to load Weather');
  }
}

Future<Forecast> forc_data(city) async {
  final fResponse = await http.get(
      'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=10530cd042fdda8d65051ca864fc86bf');

  if (fResponse.statusCode == 200) {
    return Forecast.fromJson(jsonDecode(fResponse.body));
  } else {
    throw Exception('Failed to load Forecast');
  }
}
