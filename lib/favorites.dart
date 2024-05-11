import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/firebase_courses.dart'; // Import FirebaseService
import 'app_styles.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Set<Map<String, String>> _favorites = {};

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    // Load favorite course titles from Firebase
    Set<String> favoriteTitles = await FirebaseService.fetchFavoriteCourses();
    
    // Convert titles to a set of maps
    Set<Map<String, String>> favorites = favoriteTitles.map((title) => {'title': title, 'url': ''}).toSet();

    setState(() {
      _favorites = favorites;
    });
  }

  void _openURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100], // Set AppBar background color
        title: Center(
          child: Text('Favorites',
          style: AppTextStyles.pageTitle,
          ),
        ),
      ),
      backgroundColor: Colors.white, // Set background color for the page
      body: ListView(
        children: _favorites.map((course) {
          return ListTile(
            title: Text(course['title'] ?? ''),
            onTap: () {
              _openURL(course['url'] ?? '');
            },
          );
        }).toList(),
      ),
    );
  }
}
