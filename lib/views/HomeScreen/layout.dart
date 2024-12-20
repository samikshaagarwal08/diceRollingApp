import 'package:dice_app/core/utils/Colors.dart';
import 'package:dice_app/core/utils/Images.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var imageAsset = ImageManager.dice1;

  void rollDice() {
    setState(() {
      var randomNum = Random().nextInt(6) + 1;
      imageAsset = 'assets/images/dice$randomNum.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.orange, AppColors.pink, AppColors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            // Set background color to white
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.title,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    imageAsset,
                    width: 60,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: rollDice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button, // Button background color
                    foregroundColor: AppColors.title, // Button text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Roll Dice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
