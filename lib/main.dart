import 'package:calculator/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _input = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _input = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_input);
        if (_operator == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operator == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operator == "×") {
          _output = (_num1 * _num2).toString();
        } else if (_operator == "÷") {
          _output = (_num2 != 0) ? (_num1 / _num2).toString() : "Error";
        }
        _num1 = 0;
        _num2 = 0;
        _operator = "";
        _input = _output;
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, color: color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('Calculator',style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),),
      backgroundColor: Colors.yellow,

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 54, horizontal: 12),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.orange),
                  _buildButton("8", Colors.orange),
                  _buildButton("9", Colors.orange),
                  _buildButton("÷", Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.orange),
                  _buildButton("5", Colors.orange),
                  _buildButton("6", Colors.orange),
                  _buildButton("×", Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.orange),
                  _buildButton("2", Colors.orange),
                  _buildButton("3", Colors.orange),
                  _buildButton("-", Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.red),
                  _buildButton("0", Colors.orange),
                  _buildButton("=", Colors.red),
                  _buildButton("+", Colors.blue),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}