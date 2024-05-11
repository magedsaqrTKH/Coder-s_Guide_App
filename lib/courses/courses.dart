import 'package:flutter/material.dart';
import '../favorites.dart'; // Import FavoritesPage
import 'software_courses.dart'; // Import SoftwareCoursesPage
import 'ml_courses.dart'; // Import MachineLearningCoursesPage
import 'cyber_courses.dart'; // Import CyberCoursesPage
import 'db_courses.dart'; // Import DBCoursesPage
import 'net_courses.dart'; // Import NetCoursesPage
import 'web_courses.dart'; // Import WebCoursesPage
import 'ds_courses.dart'; // Import DSCoursesPage
import 'game_courses.dart'; // Import GameCoursesPage
import '../app_styles.dart'; // Import AppTextStyles

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: Container(
          padding: EdgeInsets.only(right: 40),
          alignment: Alignment.center, // Center the text within the AppBar
          child: Text(
            'Explore Our Top-Rated Courses',
            style: AppTextStyles.pageTitle.copyWith(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/app_back.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 100),
            _buildCourseButtons(context), // Create rows of buttons
          ],
        ),
      ),
    );
  }


  Widget _buildCourseButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButtonRow(
          context,
          [
            _createCourseButton(context, 'Software Development Courses', 0),
            SizedBox(width: 40),
            _createCourseButton(context, 'Game Development Courses', 7),
            SizedBox(width: 40),
            _createCourseButton(context, 'Database Systems Courses', 3),
            SizedBox(width: 40),
            _createCourseButton(context, 'AI & ML Courses', 1),
          ],
        ),
        SizedBox(height: 40), // Space between rows
        _buildButtonRow(
          context,
          [
            _createCourseButton(context, 'Networking Courses', 4),
            SizedBox(width: 40),
            _createCourseButton(context, 'Web Development Courses', 5),
            SizedBox(width: 40),
            _createCourseButton(context, 'Data Science Courses', 6),
            SizedBox(width: 40),
            _createCourseButton(context, 'Cybersecurity Courses', 2),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context, List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  Widget _createCourseButton(BuildContext context, String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () => _navigateToPage(context, index),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SoftwareCoursesPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MachineLearningCoursesPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CyberCoursesPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DBcoursesPage()),
        );
        break;
      case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NetCoursesPage()),
          );
        break;
      case 5:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebCoursesPage()),
          );
        break;
      case 6:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DScoursesPage()),
          );
        break;
      case 7:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameCoursesPage()),
          );
        break;
      default:
        break;
    }
  }
}
