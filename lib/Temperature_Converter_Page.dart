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
      errorText = 'Please enter a value';
    } else {
      final input = double.tryParse(text);
      if (input == null) {
        errorText = 'Invalid number';
      } else {
        errorText = null;
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
      borderSide: BorderSide(color: Color(0xFFDADCE0)),
      borderRadius: BorderRadius.circular(16),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 152, 141),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 152, 141),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 400,
            height: 620,
            child: Card(
              elevation: 20,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isCelsius ? "°C" : "°F",
                          style: TextStyle(
                            fontSize: 26,
                            color: Color(0xFF1C1C1E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.swap_horiz,
                            size: 28, color: Color.fromARGB(255, 12, 152, 141)),
                        SizedBox(width: 12),
                        Text(
                          isCelsius ? "°F" : "°C",
                          style: TextStyle(
                            fontSize: 26,
                            color: Color(0xFF1C1C1E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    TextField(
                      controller: textEditingController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: "Enter temperature",
                        labelStyle: TextStyle(fontSize: 18),
                        errorText: errorText,
                        border: border,
                        focusedBorder: border.copyWith(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 12, 152, 141),
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.thermostat,
                          color: Color.fromARGB(255, 12, 152, 141),
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isCelsius = !isCelsius;
                          result = 0;
                          textEditingController.clear();
                          errorText = null;
                        });
                      },
                      child: Text(
                        "Switch to ${isCelsius ? 'Fahrenheit to Celsius' : 'Celsius to Fahrenheit'}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 12, 152, 141),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: convert,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 12, 152, 141),
                          padding: EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          "Convert",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    if (result != 0 && errorText == null)
                      Text(
                        "${isCelsius ? '°F' : '°C'} ${result.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C1E),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
