// net_courses.dart

import 'package:coders_guide/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_connection/favorites_helper.dart'; // Import FavoritesHelper

class NetCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
        'Top Rated Networking Courses', style: AppTextStyles.pageTitle),
      backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: NetCoursesList(),
    );
  }
}

class NetCoursesList extends StatefulWidget {
  @override
  _NetCoursesListState createState() => _NetCoursesListState();
}

class _NetCoursesListState extends State<NetCoursesList> {
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
    'title': 'Networking Essentials ~ 4.4/5',
    'url': 'https://www.udemy.com/course/networking-essentials/?',
  },
  {
    'title': 'Cisco Core Security: Network Security Fundamentals ~ 4.9/5',
    'url': 'https://www.pluralsight.com/courses/cisco-core-security-network-security',
  },
  {
    'title': 'AWS Certified Advanced Networking ~ 4.5/5',
    'url': 'https://www.pluralsight.com/cloud-guru/courses/aws-certified-advanced-networking-specialty-ans-c01?',
  },
  {
    'title': 'Introduction to Networking ~ 4.4/5',
    'url': 'https://www.classcentral.com/course/edx-introduction-to-networking-17999',
  },
  {
    'title': 'CompTIA Network+ ~ 4.9/5',
    'url': 'https://www.pluralsight.com/paths/comptia-network-n10-008?',
  },
  {
    'title': 'Networking in Google Cloud Specialization ~ 4.8/5',
    'url': 'https://www.coursera.org/specializations/networking-google-cloud-platform?',
  },
   {
    'title': 'Cisco CCNA: Cisco Certified Network Associate ~ 4.9/5',
    'url': 'https://www.pluralsight.com/paths/cisco-ccna-cisco-certified-network-associate-200-301?',
  },
  {
    'title': 'Connect and Protect: Networks and Network Security ~ 4.8/5',
    'url': 'https://www.coursera.org/learn/networks-and-network-security',
  },
];
