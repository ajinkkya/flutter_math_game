import 'package:flutter/material.dart';

import '../constant.dart';

class MyButtons extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.deepPurple[400];
  MyButtons({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == "C") {
      buttonColor = Colors.green;
    } else if (child == "DEL") {
      buttonColor = Colors.red;
    } else if (child == "=") {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
