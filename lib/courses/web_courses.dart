// web_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class WebCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Software Developments Courses', style:AppTextStyles.pageTitle),   
      backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: WebCoursesList(),
    );
  }
}

class WebCoursesList extends StatefulWidget {
  @override
  _WebCoursesListState createState() => _WebCoursesListState();
}

class _WebCoursesListState extends State<WebCoursesList> {
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
    'title': 'The Web Developer Bootcamp 2024 ~ 4.7/5',
    'url': 'https://www.udemy.com/course/the-web-developer-bootcamp/?',
  },
  {
    'title': 'The Advanced Web Developer Bootcamp ~ 4.7/5',
    'url': 'https://www.udemy.com/course/the-advanced-web-developer-bootcamp/?',
  },
  {
    'title': 'Advanced Django: Mastering Django and Django Rest Framework Specialization ~ 4.6/5',
    'url': 'https://www.coursera.org/specializations/codio-advanced-django-and-django-rest-framework',
  },
  {
    'title': 'The Complete Web Developer Course 3.0 ~ 4.6/5',
    'url': 'https://www.udemy.com/course/the-complete-web-developer-course-2/?',
  },
  {
    'title': 'Introduction to Web Development with HTML, CSS, JavaScript ~ 4.6/5',
    'url': 'https://www.coursera.org/learn/introduction-to-web-development-with-html-css-javacript',
  },
  {
    'title': 'Meta Front-End Developer Professional Certificate ~ 4.7/5',
    'url': 'https://www.coursera.org/professional-certificates/meta-front-end-developer',
  },
];
