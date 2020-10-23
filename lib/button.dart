import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/suggestions.dart';
import 'package:weather_app/weather.dart';

class Buttonn extends StatefulWidget {
  @override
  _ButtonnState createState() => _ButtonnState();
}

class _ButtonnState extends State<Buttonn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 200,
                    child: AutoCompleteTextField(
                      clearOnSubmit: false,
                      controller: joinn,
                      suggestions: suggestionList,
                      itemFilter: (item, query) {
                        return item
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a.compareTo(b);
                      },
                      itemSubmitted: (item) {
                        joinn.text = item;
                      },
                      itemBuilder: (context, item) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [Text(item)],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Currentweather(true)));
                      setState(() {
                        abc = joinn.text;
                        joinn.clear();
                      });
                    },
                    child: Text("Search")),
              ]),
        ),
      ),
    );
  }
}

TextEditingController joinn = TextEditingController();
var abc = joinn.text;
