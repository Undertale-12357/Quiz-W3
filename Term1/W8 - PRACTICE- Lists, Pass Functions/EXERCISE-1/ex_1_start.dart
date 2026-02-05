import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

class Ex1 extends StatelessWidget
{
  const Ex1 ({super.key});

  List<Widget> getLabels()
  {
    return colors.map((item) => Text(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              // TODO
              for (var color in colors) 
              Text(color),
              Label("Method 2: Map", bold: true),
              // TODO
              ...colors.map((color) => Text(color)).toList(),
              Label("Method 3: Dedicated Function", bold: true),
              // TODO
              ...getLabels(),
            ],
          ),
        ),
      );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
