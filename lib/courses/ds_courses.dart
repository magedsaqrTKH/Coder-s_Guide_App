// datasacience_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class DScoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Data Science Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100]
      ),
      backgroundColor: Colors.white,
      body: DSCoursesList(),
    );
  }
}

class DSCoursesList extends StatefulWidget {
  @override
  _DSCoursesListState createState() => _DSCoursesListState();
}

class _DSCoursesListState extends State<DSCoursesList> {
  late Set<String> _favorites;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _favorites = await FavoritesHelper.loadFavorites();
    setState(() {});
  }

  void _toggleFavorite(String title, String url) {
    FavoritesHelper.toggleFavorite(title, url, _favorites);
    setState(() {});
  }

  void _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: courses?.length ?? 0,
            itemBuilder: (context, index) {
              final course = courses?[index];
              final isFavorite = _favorites.contains(course?['title'] ?? '');
              return ListTile(
                title: Text(course?['title'] ?? ''),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    _toggleFavorite(course?['title'] ?? '', course?['url'] ?? '');
                  },
                ),
                onTap: () {
                  _openURL(course?['url'] ?? '');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

final List<Map<String, String>>? courses = [
  {
    'title': 'Machine Learning & Data Science Bootcamp with R & Python ~ 4.9/5',
    'url': 'https://www.udemy.com/course/machine-learning-data-science-bootcamp-with-r-python/?',
  },
  {
    'title': 'Applied Data Science with Python Specialization ~ 4.5/5',
    'url': 'https://www.coursera.org/specializations/data-science-python?',
  },
  {
    'title': 'Advanced Data Science with IBM Specialization ~ 4.4/5',
    'url': 'https://www.coursera.org/specializations/advanced-data-science-ibm',
  },
  {
    'title': 'Introduction to Data Science in Python ~ 4.5/5',
    'url': 'https://www.coursera.org/learn/python-data-analysis',
  },
  {
    'title': 'EMC DATA SCIENCE AND BIG DATA ANALYTICS ~ 4.5/5',
    'url': 'https://www.globalknowledge.com/en-eg/courses/emc/network_management/dsbda',
  },
  {
    'title': 'IBM: Analyzing Data with Python ~ 4.5/5',
    'url': 'https://www.edx.org/learn/python/ibm-analyzing-data-with-python',
  },
  {
    'title': 'Deep Learning Specialization ~ 4.9/5',
    'url': 'https://www.coursera.org/specializations/deep-learning?',
  }, 
  {
    'title': 'Deep Learning-Udacity ~ 4.5/5',
    'url': 'https://www.udacity.com/course/deep-learning-nanodegree--nd101',
  },
];
