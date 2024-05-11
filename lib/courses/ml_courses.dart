// machinelearning_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class MachineLearningCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated AI & Machine Learning Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: MachineLearningCoursesList(),
    );
  }
}

class MachineLearningCoursesList extends StatefulWidget {
  @override
  _MachineLearningCoursesListState createState() => _MachineLearningCoursesListState();
}

class _MachineLearningCoursesListState extends State<MachineLearningCoursesList> {
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
    'title': 'Data Science and Machine Learning Bootcamp with Python and R ~ 4.0/5',
    'url': 'https://www.udemy.com/course/data-science-and-machine-learning-bootcamp-with-python-and-r/',
  },
  {
    'title': 'Deep Learning Specialization ~ 4.9/5',
    'url': 'https://www.coursera.org/specializations/deep-learning',
  },
  {
    'title': 'Machine Learning Engineering for Production (MLOps) Specialization ~ 4.7/5',
    'url': 'https://www.coursera.org/specializations/machine-learning-engineering-for-production-mlops',
  },
  {
    'title': 'Deep Learning-Udacity ~ 4.5/5',
    'url': 'https://www.udacity.com/course/deep-learning-nanodegree--nd101',
  },
  {
    'title': 'Machine Learning Specialization ~ 4.9/5',
    'url': 'https://www.coursera.org/specializations/machine-learning-introduction?',
  },
  {
    'title': 'AI For Everyone ~ 4.8/5',
    'url': 'https://www.coursera.org/learn/ai-for-everyone?',
  },
  {
    'title': 'Natural Language Processing Specialization ~ 4.6/5',
    'url': 'https://www.coursera.org/specializations/natural-language-processing?',
  },
  {
    'title': 'Generative AI-Udacity ~ 4.5/5',
    'url': 'https://www.udacity.com/course/generative-ai--nd608',
  },
];
