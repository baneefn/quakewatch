import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KalkulatorScreen extends StatefulWidget {
  @override
  _KalkulatorScreenState createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  TextEditingController inputController1 = TextEditingController();
  TextEditingController inputController2 = TextEditingController();
  TextEditingController resultController = TextEditingController();

  String operation = ''; // Operasi kalkulator

  void calculate(String newOperation) {
    double num1 = double.tryParse(inputController1.text) ?? 0;
    double num2 = double.tryParse(inputController2.text) ?? 0;

    double result = 0;

    switch (newOperation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          resultController.text = 'Tidak dapat dibagi oleh 0';
          return;
        }
        break;
    }

    resultController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AIO Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: inputController1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Input 1'),
              ),
              TextField(
                controller: inputController2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Input 2'),
              ),
              TextField(
                controller: resultController,
                enabled: false,
                decoration: InputDecoration(labelText: 'Hasil'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      operation = '+';
                      calculate(operation);
                    },
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      operation = '-';
                      calculate(operation);
                    },
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      operation = '*';
                      calculate(operation);
                    },
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      operation = '/';
                      calculate(operation);
                    },
                    child: Text('/'),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.deepPurple,
            onTap: (value) {
              if (value == 0) {
                context.goNamed('status');
              } else if (value == 1) {
                context.goNamed('more');
              } else if (value == 2) {
                context.goNamed('profile');
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'More',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]));
  }
}
