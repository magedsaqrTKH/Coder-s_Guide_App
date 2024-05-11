import 'package:flutter/material.dart';

class AppTextStyles {
  // Text styles
  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'ArialBlack'
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  // Add more text styles as needed
}

class AppButtonStyles {
  // Button styles
  static ButtonStyle elevatedButtonStyle(Color? color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // Add more button styles as needed
}



class AppGradients {
  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Colors.blue, Colors.green],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Add more gradient styles as needed
}

class AppColors {
  // Custom colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;
  static const Color accentColor = Colors.orange;
  static const Color backgroundColor = Colors.black;

  // Add more custom colors as needed
}
