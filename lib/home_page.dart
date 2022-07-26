import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/constant.dart';
import 'package:math_game/utility/my_buttons.dart';
import 'package:math_game/utility/result_massage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // User Answer
  String userAnswer = '';

  // User Tapped a Button
  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        // Calculate is User is Correct or In-Correct.
        checkResult();
      } else if (button == "C") {
        // Clear the input
        userAnswer = "";
      } else if (button == "DEL") {
        // Delete the last Number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        // Maximum 3 numbers can be inputed
        userAnswer += button;
      }
    });
  }

  // Check is User is Correct or Not...
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMassage(
                massage: "Correct!",
                onTap: goToNextQuestion,
                icon: Icons.arrow_forward);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMassage(
                massage: "Sorry Try Again!",
                onTap: goBackToQuestion,
                icon: Icons.rotate_left);
          });
    }
  }

  // Create Random Numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTIONS..
  void goToNextQuestion() {
    // Dismiss alert dialog
    Navigator.of(context).pop();

    // Reset Values
    setState(() {
      userAnswer = "";
    });

    // Create a New Question
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  // GO BACK TO PREVIOUS QUESTION...
  void goBackToQuestion() {
    // Dismiss alert dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          // Level progress, player needs 5 correct answers...
          // in a row to proceed to next level.
          Container(
            height: 160,
            color: Colors.deepPurple,
            child: Center(
              child: Text(
                "Math Game!",
                style: whiteTextStyle,
              ),
            ),
          ),
          // Questions
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Question
                  Text(
                    "$numberA + $numberB = ",
                    style: whiteTextStyle,
                  ),
                  // Answer Box
                  Container(
                    height: 70,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: whiteTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // NumberPad (Grid of Numbers)
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButtons(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
