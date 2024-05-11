// software_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class SoftwareCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Software Developments Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: SoftwareCoursesList(),
    );
  }
}

class SoftwareCoursesList extends StatefulWidget {
  @override
  _SoftwareCoursesListState createState() => _SoftwareCoursesListState();
}

class _SoftwareCoursesListState extends State<SoftwareCoursesList> {
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
          padding: const EdgeInsets.all(8.0)
        ),
        Expanded(
          child: ListView.builder(
            itemCount: softwareCourses?.length ?? 0,
            itemBuilder: (context, index) {
              final course = softwareCourses?[index];
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

final List<Map<String, String>>? softwareCourses = [
  {
    'title': 'Introduction to Software Engineering ~ 4.7/5',
    'url': 'https://www.coursera.org/learn/introduction-to-software-engineering',
  },
  {
    'title': 'DevOps and Software Engineering ~ 4.7/5',
    'url': 'https://www.coursera.org/professional-certificates/devops-and-software-engineering',
  },
  {
    'title': 'IBM Full Stack Cloud Developer ~ 4.6/5',
    'url': 'https://www.coursera.org/professional-certificates/ibm-full-stack-cloud-developer',
  },
  {
    'title': 'Java Masterclass for Software Developers ~ 4.6/5',
    'url': 'https://www.educative.io/courses/java-masterclass-developers',
  },
  {
    'title': 'UBCx: Software Engineering: Introduction ~ 4.5/5',
    'url': 'https://www.edx.org/learn/software-engineering/university-of-british-columbia-software-engineering-introduction',
  },
  {
    'title': 'Object Oriented Programming in Java ~ 4.5/5',
    'url': 'https://www.udacity.com/course/object-oriented-programming-in-java--ud283',
  },
  {
    'title': 'Clean Code-Udemy ~ 4.6/5',
    'url': 'https://www.udemy.com/course/writing-clean-code/?couponCode=LETSLEARNNOW',
  },
  {
    'title': 'Software Design and Architecture Specialization ~ 4.6/5',
    'url': 'https://www.coursera.org/specializations/software-design-architecture?',
  },
];
