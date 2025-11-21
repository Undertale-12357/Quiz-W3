import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget
{
  const SelectableButton({super.key});

  
  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {

  String textLabel = "Not Seleacted";
    Color backgroundColor = const Color(0xFFE3F2FD);
    Color tectColor = Colors.black;
    bool isSelected = false;

   void selectedButton()
   {
    setState(() {
      if (isSelected)
      {
        isSelected = false;
        textLabel = "Not Selected";
        backgroundColor = const Color(0xFFE3F2FD);
        tectColor = Colors.black;
      }
      else
      {
        isSelected = true;
        textLabel = "Selected";
        backgroundColor = const Color(0xFF2196F3);
        tectColor = Colors.white;
      }
    });
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
            onPressed: selectedButton,
            style: ElevatedButton.styleFrom(backgroundColor: backgroundColor,),
            child: Center(
              child: Text(
                textLabel,
                style: TextStyle(color: tectColor,),
                ),
            )
          ),
      ),
    );
  }
}

class Ex1 extends StatefulWidget
{
  
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            children: [
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
          ],
        ),
      ),
    );
  }
}