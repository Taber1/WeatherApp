<<<<<<< HEAD

=======
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
class Weather {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  Weather({this.date, this.name, this.temp, this.main, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date:
          DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'],
<<<<<<< HEAD
      temp: double.parse(((json['main']['temp'].toDouble())-273.15).toStringAsFixed(2)),
=======
      temp: (json['main']['temp'].toDouble() - 273.15),
>>>>>>> 25ade2b3667f9053f0e896318a5d0ee21c0738c4
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}
