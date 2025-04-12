import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  String? errorText;

  bool isCelsius = true;
  void convert() {
    final text = textEditingController.text;
    if (text.isEmpty) {
      errorText = 'Can\'t be empty';
    } else {
      errorText = null;
      final input = double.tryParse(text);
      if (input == null) {
        errorText = 'Enter a valid number';
      } else {
        result = isCelsius ? (input * 9 / 5) + 32 : (input - 32) * 5 / 9;
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.brown,
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );

    final textStyle = TextStyle(
      color: Colors.brown,
      fontSize: 23,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 550,
          child: Card(
            elevation: 5,
            shadowColor: const Color.fromARGB(255, 104, 95, 95),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Toggle Conversion Direction
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isCelsius ? '°C' : '°F', style: textStyle),
                      Icon(Icons.arrow_forward, color: Colors.brown),
                      Text(isCelsius ? '°F' : '°C', style: textStyle),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: textEditingController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorText: errorText,
                      errorBorder: border,
                      focusedErrorBorder: border,
                      label: Text("Temperature"),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter temperature",
                      prefixIcon: Icon(Icons.thermostat),
                      prefixIconColor: Colors.brown,
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                  SizedBox(height: 20),
                  // Switch Button
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCelsius = !isCelsius;
                        result = 0;
                        textEditingController.clear();
                      });
                    },
                    child: Text(
                      "Switch to ${isCelsius ? 'Fahrenheit to Celsius' : 'Celsius to Fahrenheit'}",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Convert Button
                  TextButton(
                    onPressed: () => convert(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Convert"),
                  ),
                  SizedBox(height: 20),
                  // Result Display
                  Text(
                    result == 0 && errorText == null
                        ? ''
                        : '${isCelsius ? '°F' : '°C'} ${result.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
