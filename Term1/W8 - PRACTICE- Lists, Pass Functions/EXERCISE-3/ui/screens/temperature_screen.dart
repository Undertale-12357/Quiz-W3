import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {

  final TextEditingController celsiusController = TextEditingController();
  String fahrenheitText = '0.0';

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  void convertTemp (String celsiusText)
  {
    if (celsiusText.isEmpty)
    {
      setState(() {
        fahrenheitText = "0.0";
      });
      return;
    }

    final double? celsius = double.tryParse(celsiusText);

    if (celsius == null)
    {
      setState(() {
        fahrenheitText = "Invalid Input";
      });
    }
    else
    {
      final double fahrenheit = (celsius * 9 / 5) + 32;
      setState(() {
        fahrenheitText = fahrenheit.toString();
      });
    }
  }

  @override
  void dispose()
  {
    celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: celsiusController,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: convertTemp,
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                fahrenheitText,
              )
            ),
          ],
        ),
      ),
    );
  }
}
