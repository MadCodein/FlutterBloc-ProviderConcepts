import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => WeatherInfo(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Provider Pattern Implementation"),
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [MySpecialHeading(), MySpecialContent()]),
          ),
          floatingActionButton: MyFloatingActionButton(),
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      tooltip: "Change Type",
      onPressed: () {
        String newTempType =
            weatherInfo.temperatureType == "celcius" ? "fahrenheit" : "celcius";
        weatherInfo.updateTemperatureType = newTempType;

        int newTempVal = Random().nextInt(100);
        weatherInfo.updateTemperatureVal = newTempVal;
      },
      child: Icon(Icons.change_history),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // one method of doing this
    final weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.temperatureVal.toString(),
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // another method of doing this
      child: Consumer<WeatherInfo>(
        builder: (context, weatherInfo, child) => Text(
          weatherInfo.temperatureType,
          style: TextStyle(
            fontSize: 30,
            color: decideColor(weatherInfo),
          ),
        ),
      ),
    );
  }
}
