import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for opening URLs

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Game Development',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'The process of creating video games involves design, development, testing, and release of interactive digital entertainment software.',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                Text(
                  'Jobs:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Game Designer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Conceptualizes gameplay, levels, and characters.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Game Programmer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Writes code for game features, AI, and physics.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Game Artist: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Creates 2D/3D graphics, animations, and special effects.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Top Certifications:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),
                _buildCertificationItem(
                  'Unity Certified Programmer',
                  'https://unity.com/products/unity-certifications/professional-programmer',
                ),
                _buildCertificationItem(
                  'Unreal Engine Certified Professional',
                  'https://www.unrealengine.com/en-US/professional-training',
                ),
                _buildCertificationItem(
                  'Maya Certified Professional',
                  'https://www.credly.com/badges/5499eaaf-6ce9-4458-829c-6d7fd1a78246?source=linked_in_profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCertificationItem(String title, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          '• $title',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
