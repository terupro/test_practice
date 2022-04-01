import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:test_practice/calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Practice',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final value1Controller = TextEditingController();
  final value2Controller = TextEditingController();
  int value1 = 0;
  int value2 = 0;
  int answer = 0;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test Practice')),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextField(
                controller: value1Controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: value2Controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Text(
                answer.toString(),
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Calc calc = Calc();
                        value1 = int.parse(value1Controller.text);
                        value2 = int.parse(value2Controller.text);
                        answer = calc.add(value1, value2);
                      });
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        value1Controller.text = '';
                        value2Controller.text = '';
                        answer = 0;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Calc calc = Calc();
                        value1 = int.parse(value1Controller.text);
                        value2 = int.parse(value2Controller.text);
                        answer = calc.sub(value1, value2);
                      });
                    },
                    child: const Text('Sub'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
