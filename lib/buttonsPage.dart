import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final color;
  final textColor;
  final String? buttonText;
  final buttonTapped;
  // final Function onPressed;

  const ButtonPage({super.key, this.color, this.textColor, this.buttonText, this.buttonTapped});
  // const ButtonPage({super.key, this.color, this.textColor, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        // onTap: () {
        //   // onPressed(buttonText);
        //
        // },
        onTap: buttonTapped,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
