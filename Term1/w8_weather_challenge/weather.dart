import 'package:flutter/material.dart';

enum season{winter, sprint, summer, fall}

class SeasonCard extends StatefulWidget
{
  final String country;
  
  const SeasonCard({required this.country, super.key});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Weather extends StatefulWidget
{
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}