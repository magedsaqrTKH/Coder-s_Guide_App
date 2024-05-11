// game_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class GameCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Game Development Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100]
      ),
      backgroundColor: Colors.white,
      body: GameCoursesList(),
    );
  }
}

class GameCoursesList extends StatefulWidget {
  @override
  _GameCoursesListState createState() => _GameCoursesListState();
}

class _GameCoursesListState extends State<GameCoursesList> {
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
    'title': 'C# Programming for Unity Game Development Specialization ~ 4.7/5',
    'url': 'https://www.coursera.org/specializations/programming-unity-game-development',
  },
  {
    'title': 'C++ Programming for Unreal Game Development Specialization ~ 4.5/5',
    'url': 'https://www.coursera.org/specializations/cplusplusunrealgamedevelopment',
  },
  {
    'title': 'Complete C# Unity Game Developer 3D ~ 4.7/5',
    'url': 'https://www.udemy.com/course/unitycourse2/?',
  },
  {
    'title': 'Introduction to Game Design ~ 4.7/5',
    'url': 'https://www.coursera.org/learn/game-design?',
  },
  {
    'title': 'Game Development for Modern Platforms ~ 4.8/5',
    'url': 'https://www.classcentral.com/course/gamedev-platforms-4315',
  },
  {
    'title': 'Unreal Engine 4 Fundamentals ~ 4.9/5',
    'url': 'https://www.pluralsight.com/courses/unreal-engine-4-fundamentals',
  },
  {
    'title': 'Unity Game Development Master Class ~ 4.3/5',
    'url': 'https://www.udemy.com/course/unity-game-development-master-class/?',
  },
  {
    'title': 'Game Design and Development 5: Capstone Project ~ 4.8/5',
    'url': 'https://www.coursera.org/learn/game-design-and-development-5?',
  },
];
