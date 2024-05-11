// database_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class DBcoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Database Systems Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100]
      ),
      backgroundColor: Colors.white,
      body: DBCoursesList(),
    );
  }
}

class DBCoursesList extends StatefulWidget {
  @override
  _DBCoursesListState createState() => _DBCoursesListState();
}

class _DBCoursesListState extends State<DBCoursesList> {
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
    'title': 'SQL for Data Science ~ 4.6/5',
    'url': 'https://www.coursera.org/learn/sql-for-data-science?',
  },
  {
    'title': 'SQL, NoSQL, and Relational Database Fundamentals ~ 4.5/5',
    'url': 'https://www.edx.org/certificates/professional-certificate/ibm-sql-nosql-and-relational-database-fundamentals?',
  },
  {
    'title': 'Advanced Relational Database and SQL ~ 4.5/5',
    'url': 'https://www.coursera.org/projects/advanced-rdb-sql',
  },
  {
    'title': 'Databases and SQL for Data Science with Python ~ 4.6/5',
    'url': 'https://www.coursera.org/learn/sql-data-science?',
  },
  {
    'title': 'Introduction to MongoDB ~ 4.5/5',
    'url': 'https://learn.mongodb.com/learning-paths/introduction-to-mongodb',
  },
  {
    'title': 'AWS Certified Database - Specialty ~ 4.8/5',
    'url': 'https://aws.amazon.com/certification/certified-database-specialty/',
  },
  {
    'title': 'Oracle Database 19c: Basic SQL ~ 4.4/5',
    'url': 'https://www.linkedin.com/learning/oracle-database-19c-basic-sql',
  },
  {
    'title': 'Database Management Essentials ~ 4.0/5',
    'url': 'https://www.classcentral.com/course/dbessentials-4337',
  },
];
