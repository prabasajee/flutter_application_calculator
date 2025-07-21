import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _previousValue = '';
  String _operation = '';
  bool _isNewInput = true;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _clear();
      } else if (value == '⌫') {
        _backspace();
      } else if (value == '=') {
        _calculate();
      } else if (['+', '-', '×', '÷'].contains(value)) {
        _setOperation(value);
      } else {
        _inputNumber(value);
      }
    });
  }

  void _clear() {
    _display = '0';
    _previousValue = '';
    _operation = '';
    _isNewInput = true;
  }

  void _backspace() {
    if (_display.length > 1) {
      _display = _display.substring(0, _display.length - 1);
    } else {
      _display = '0';
      _isNewInput = true;
    }
  }

  void _inputNumber(String number) {
    if (number == '.' && _display.contains('.')) return;
    
    if (_isNewInput) {
      _display = number == '.' ? '0.' : number;
      _isNewInput = false;
    } else {
      _display += number;
    }
  }

  void _setOperation(String op) {
    if (_operation.isNotEmpty && !_isNewInput) {
      _calculate();
    }
    _previousValue = _display;
    _operation = op;
    _isNewInput = true;
  }

  void _calculate() {
    if (_operation.isEmpty || _previousValue.isEmpty) return;

    double prev = double.tryParse(_previousValue) ?? 0;
    double current = double.tryParse(_display) ?? 0;
    double result = 0;

    switch (_operation) {
      case '+':
        result = prev + current;
        break;
      case '-':
        result = prev - current;
        break;
      case '×':
        result = prev * current;
        break;
      case '÷':
        if (current == 0) {
          _display = 'Error';
          _clear();
          return;
        }
        result = prev / current;
        break;
    }

    _display = result == result.toInt() 
        ? result.toInt().toString() 
        : result.toString();
    _operation = '';
    _previousValue = '';
    _isNewInput = true;
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[300],
            foregroundColor: textColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_operation.isNotEmpty && _previousValue.isNotEmpty)
                    Text(
                      '$_previousValue $_operation',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    _display,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // Row 1: C, ⌫, ÷
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C', color: Colors.red[400], textColor: Colors.white),
                        _buildButton('⌫', color: Colors.orange[400], textColor: Colors.white),
                        _buildButton('÷', color: Colors.orange[400], textColor: Colors.white),
                      ],
                    ),
                  ),
                  // Row 2: 7, 8, 9, ×
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7'),
                        _buildButton('8'),
                        _buildButton('9'),
                        _buildButton('×', color: Colors.orange[400], textColor: Colors.white),
                      ],
                    ),
                  ),
                  // Row 3: 4, 5, 6, -
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4'),
                        _buildButton('5'),
                        _buildButton('6'),
                        _buildButton('-', color: Colors.orange[400], textColor: Colors.white),
                      ],
                    ),
                  ),
                  // Row 4: 1, 2, 3, +
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1'),
                        _buildButton('2'),
                        _buildButton('3'),
                        _buildButton('+', color: Colors.orange[400], textColor: Colors.white),
                      ],
                    ),
                  ),
                  // Row 5: 0, ., =
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(20),
                              ),
                              onPressed: () => _onButtonPressed('0'),
                              child: const Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildButton('.'),
                        _buildButton('=', color: Colors.orange[400], textColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
