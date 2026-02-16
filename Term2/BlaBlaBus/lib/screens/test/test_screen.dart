import 'package:blabla/Term2/BlaBlaBus/lib/theme/theme.dart';
import 'package:blabla/Term2/BlaBlaBus/lib/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlaButton(
            icon: Icons.message,
            label: "Contact Volodia",
            color: BlaColors.backgroundAccent,
          ),
          BlaButton(
            icon: Icons.calendar_month,
            label: "Request to Book",
            color: BlaColors.primary,
          ),
        ],
      ),
    );
  }
}
