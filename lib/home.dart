import 'package:flutter/material.dart';
import 'chatbot_integration/chat.dart'; // Import the ChatPage
import 'job_explore/explore.dart'; // Import the ExplorePage
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'courses/courses.dart';
import 'job_explore/game.dart';
import 'job_explore/ai.dart';
import 'job_explore/cyber.dart';
import 'job_explore/database.dart';
import 'job_explore/ds.dart';
import 'job_explore/networking.dart';
import 'job_explore/software.dart';
import 'job_explore/web.dart';
import 'courses/cyber_courses.dart';
import 'courses/db_courses.dart';
import 'courses/ds_courses.dart';
import 'courses/game_courses.dart';
import 'courses/ml_courses.dart';
import 'courses/net_courses.dart';
import 'courses/software_courses.dart';
import 'courses/web_courses.dart';
import 'app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginscreen()),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        centerTitle: true, // Ensure the title is centered
        title: Text(
          "Welcome to The Coder's Guide",
          style: (AppTextStyles.pageTitle), // Make sure the color contrasts with the background
        ),
        actions: [
          _buildPopupMenu(
            context,
            'Explore',
            {
              'All Fields': ExplorePage(),
              'Game Development': GamePage(),
              'Software Development': SoftwarePage(),
              'Cybersecurity': CyberPage(),
              'AI and Machine Learning': AiPage(),
              'Database Systems': DatabasePage(),
              'Data Science': DataPage(),
              'Networking': NetworkingPage(),
              'Web Development': WebPage(),
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatWidget()),
              );
            },
            child: Text('Chat', style: TextStyle(color: Colors.black)), // Ensure visibility
          ),
          _buildPopupMenu(
            context,
            'Courses',
            {
              'All Courses': CoursesPage(),
              'Game Development Courses': GameCoursesPage(),
              'Software Development Courses': SoftwareCoursesPage(),
              'Cybersecurity Courses': CyberCoursesPage(),
              'AI and Machine Learning Courses': MachineLearningCoursesPage(),
              'Database Systems Courses': DBcoursesPage(),
              'Data Science Courses': DScoursesPage(),
              'Networking Courses': NetCoursesPage(),
              'Web Development Courses': WebCoursesPage(),
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
            color: Colors.red, // Make sure the color is visible
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height, // Ensure full height
        width: MediaQuery.of(context).size.width, // Ensure full width
        child: Image.asset(
          'assets/backapp.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context, String title, Map<String, Widget> options) {
    return PopupMenuButton<String>(
      onSelected: (String key) {
        final selectedPage = options[key];
        if (selectedPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => selectedPage),
          );
        }
      },
      itemBuilder: (context) {
        return options.keys.map((key) {
          return PopupMenuItem<String>(
            value: key,
            child: Text(key),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(title, style: TextStyle(color: Colors.black)), // Padding correction
      ),
    );
  }
}