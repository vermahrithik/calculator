import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttonsPage.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // String output = '0';
  // String _output = '0';
  // double num1 = 0;
  // double num2 = 0;
  // String operand = '0';
  //
  // late final color;
  // late final textColor;
  // late final String? buttonText;
  // late final buttonTapped;
  //
  // equalPressed(String buttonText){
  //   if(buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/'){
  //     num1= double.parse(output);
  //     operand=buttonText;
  //     _output='0';
  //   }else if(buttonText=='.'){
  //     if(_output.contains('.')){
  //       print('Already exists : "."');
  //     }else{
  //       _output=_output+buttonText;
  //     }
  //   }else if(buttonText=="="){
  //     if(operand=='+'){
  //       _output=(num1+num2).toString();
  //     }
  //     if(operand=='-'){
  //       _output=(num1-num2).toString();
  //     }
  //     if(operand=='*'){
  //       _output=(num1*num2).toString();
  //     }
  //     if(operand=='/'){
  //       _output=(num1/num2).toString();
  //     }
  //     num1=0;
  //     num2=0;
  //     operand= "";
  //   }else{
  //     _output = _output + buttonText;
  //   }
  //   print(_output);
  //   setState(() {
  //     output = double.parse(_output).toStringAsFixed(2);
  //   });
  // }

  final List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '.', '0', '00', '+',
  ];

  String userInput = '';
  String result = '0';

  // Widget buildButton(String buttonText) {
  //   return Padding(
  //     padding: const EdgeInsets.all(2.0),
  //     child: GestureDetector(
  //       // onTap: () {
  //       //   // onPressed(buttonText);
  //       //
  //       // },
  //       onTap: equalPressed(buttonText),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(5),
  //         child: Container(
  //           color: color,
  //           child: Center(
  //             child: Text(
  //               buttonText!,
  //               style: TextStyle(
  //                 color: textColor,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userInput),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(result),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(userInput),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   alignment: Alignment.centerRight,
                  //   child: Text(output),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                // return buildButton(buttons[index]);
                return ButtonPage(
                  buttonText: buttons[index],
                  color: isOperator(buttons[index]) ? Colors.grey : Colors.grey.shade50,
                  textColor: isOperator(buttons[index]) ? Colors.white : Colors.grey,
                  buttonTapped: (){
                    setState(() {
                      userInput += buttons[index];
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ButtonPage(
                    buttonText: "CLEAR",
                    color: Colors.grey,
                    textColor: Colors.white,
                    buttonTapped: (){
                      setState(() {
                        userInput = '';
                        result='0';
                        // output='0';
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ButtonPage(
                    buttonText: "=",
                    color: Colors.grey,
                    textColor: Colors.white,
                    buttonTapped: (){
                      setState(() {
                        equalPressed();
                        // equalPressed("=");
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // void handleButtonTap(String buttonText) {
  //   setState(() {
  //     if (buttonText == "CLEAR") {
  //       userInput = '';
  //       result = '0';
  //     } else if (buttonText == "=") {
  //       try {
  //         result = calculateResult();
  //       } catch (e) {
  //         result = 'Error';
  //       }
  //     } else {
  //       userInput += buttonText;
  //     }
  //   });
  // }

  // String calculateResult() {
  //   List<String> tokens = userInput.split(RegExp(r'(\D)')).where((e) => e.isNotEmpty).toList();
  //   List<String> operators = userInput.split(RegExp(r'(\d+)')).where((e) => !RegExp(r'^\d+$').hasMatch(e)).toList();
  //
  //   double res = double.parse(tokens[0]);
  //
  //   for (int i = 0; i < operators.length; i++) {
  //     String op = operators[i];
  //     double num = double.parse(tokens[i + 1]);
  //
  //     if (op == '+') res += num;
  //     if (op == '-') res -= num;
  //     if (op == 'x') res *= num;
  //     if (op == '/') res /= num;
  //   }
  //
  //   return res.toString();
  // }

  /// ---------------------------------

  void equalPressed(){
    String finalInput = userInput;
    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    print(exp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    result = eval.toStringAsFixed(3);
  }
}
