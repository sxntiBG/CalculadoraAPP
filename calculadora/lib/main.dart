import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double num1 = 0.0;
  double num2 = 0.0;
  double result = 0.0;

  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void calculateResult(String operation) {
    double value1 = double.tryParse(num1Controller.text) ?? 0.0;
    double value2 = double.tryParse(num2Controller.text) ?? 0.0;

    setState(() {
      num1 = value1;
      num2 = value2;

      switch (operation) {
        case 'Sumar':
          result = num1 + num2;
          break;
        case 'Restar':
          result = num1 - num2;
          break;
        case 'Multiplicar':
          result = num1 * num2;
          break;
        case 'Dividir':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = 0.0;
          }
          break;
      }

      resultController.text = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCalcButton('Sumar'),
                buildCalcButton('Restar'),
                buildCalcButton('Multiplicar'),
                buildCalcButton('Dividir'),
              ],
            ),
            TextField(
              controller: resultController,
              decoration: const InputDecoration(labelText: 'Resultado'),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCalcButton(String operation) {
    return Container(
      margin: const EdgeInsets.all(8.0), // Agrega un margen de 8.0
      child: SizedBox(
        width: 110,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            calculateResult(operation);
          },
          child: Text(operation),
        ),
      ),
    );
  }
}
