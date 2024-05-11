// cyber_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class CyberCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Cybersecurity Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: CyberCoursesList(),
    );
  }
}

class CyberCoursesList extends StatefulWidget {
  @override
  _CyberCoursesListState createState() => _CyberCoursesListState();
}

class _CyberCoursesListState extends State<CyberCoursesList> {
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
    'title': 'Foundations of Cybersecurity ~ 4.9/5',
    'url': 'https://www.coursera.org/learn/foundations-of-cybersecurity',
  },
  {
    'title': 'Cybersecurity for Tech Professionals ~ 4.7/5',
    'url': 'https://www.coursera.org/learn/cybersecurity-for-tech-professionals',
  },
  {
    'title': 'Advanced Cybersecurity Program ~ 4.8/5',
    'url': 'https://online.stanford.edu/programs/advanced-cybersecurity-program',
  },
  {
    'title': 'Cybersecurity Fundamentals ~ 4.0/5',
    'url': 'https://www.edx.org/learn/cybersecurity/rochester-institute-of-technology-cybersecurity-fundamentals',
  },
  {
    'title': 'CompTIA Security+ ~ 4.5/5',
    'url': 'https://www.cybrary.it/course/comptia-security-plus?',
  },
  {
    'title': 'Penetration Testing and Ethical Hacking ~ 4.5/5',
    'url': 'https://www.cybrary.it/course/ethical-hacking?',
  },
  {
    'title': 'IBM Cybersecurity Analyst Professional Certificate ~ 4.6/5',
    'url': 'https://www.coursera.org/professional-certificates/ibm-cybersecurity-analyst?',
  }, 
  {
    'title': 'IT and Cybersecurity Foundations ~ 4.4/5',
    'url': 'https://www.cybrary.it/career-path/it-and-cybersecurity-foundations',
  },
];
