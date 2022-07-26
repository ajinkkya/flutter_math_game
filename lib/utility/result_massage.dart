import 'package:flutter/material.dart';

import '../constant.dart';

class ResultMassage extends StatelessWidget {
  final String massage;
  final VoidCallback onTap;
  final icon;
  const ResultMassage({
    Key? key,
    required this.massage,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // The Result
            Text(
              massage,
              style: whiteTextStyle,
            ),
            // Button to go to next Question
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
