import 'package:flutter/material.dart';
import 'ai.dart';
import 'software.dart';
import 'cyber.dart';
import 'database.dart';
import 'networking.dart';
import 'web.dart';
import 'ds.dart';
import 'game.dart';
import '../app_styles.dart'; // Import AppTextStyles

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( // Center the title
          child: Text(
            'Explore Computer Science Fields',
            style: AppTextStyles.pageTitle,
          ),
        ),
        backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/exp.png', // Image in the body
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 100),
            _buildFieldButtons(context), // Your field buttons
          ],
        ),
      ),
    );
  }

  Widget _buildFieldButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Ensure buttons are centered
      children: [
        _buildButtonRow(
          context,
          [
            _createFieldButton(context, 'Software Development', 0),
            SizedBox(width: 40),
            _createFieldButton(context, 'Game Development', 7),
            SizedBox(width: 40),
            _createFieldButton(context, 'Data Science', 6),
            SizedBox(width: 40),
            _createFieldButton(context, 'Cybersecurity', 2),
          ],
        ),
        SizedBox(height: 40), // Space between rows
        _buildButtonRow(
          context,
          [
            _createFieldButton(context, 'Database Systems', 3),
            SizedBox(width: 40),
            _createFieldButton(context, 'AI & ML', 1),
            SizedBox(width: 40),
            _createFieldButton(context, 'Networking', 4),
            SizedBox(width: 40),
            _createFieldButton(context, 'Web Development', 5),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context, List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Align buttons in the row
      children: buttons,
    );
  }

  Widget _createFieldButton(BuildContext context, String label, int index) {
    return ElevatedButton(
      onPressed: () => _navigateToPage(context, index),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white, // Button color
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SoftwarePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AiPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CyberPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DatabasePage()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkingPage()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebPage()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
        break;
      default:
        break;
    }
  }
}
