import 'package:flutter/material.dart';
import 'package:tempcon/Temperature_Converter_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Temperature Converter",
      // theme: ThemeData.dark(),
      home: TemperatureConverterPage(),
    );
  }
}
