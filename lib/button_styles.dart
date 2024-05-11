import 'package:flutter/material.dart';

class ExploreButtonStyle {
  static ButtonStyle exploreButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 124, 208, 247),
      padding: EdgeInsets.symmetric(vertical: 16),
      textStyle: TextStyle(fontSize: 18),
    );
  }
}
