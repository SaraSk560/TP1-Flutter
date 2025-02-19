import 'package:flutter/material.dart';
import './weather.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  String city;
  TextEditingController cityEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${city}'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Tap a City..'),
                controller: cityEditingController,
                onChanged: (String str) {
                  setState(() {
                    city = str;
                  });
                },
                onSubmitted: (String str) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(city)),
                  );
                  cityEditingController.text = '';
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Get Weather'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Weather(city)),
                );
                cityEditingController.text = '';
              },
            ),
          ),
        ],
      ),
    );
  }
}
