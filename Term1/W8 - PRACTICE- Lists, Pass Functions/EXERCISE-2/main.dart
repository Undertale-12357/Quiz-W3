import 'package:flutter/material.dart';

import 'ui/screens/profile.dart';
 
class Ex2 extends StatelessWidget
{
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileApp();
  }
}
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(),
  ));
}
