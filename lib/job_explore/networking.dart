import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required to open URLs in a browser

class NetworkingPage extends StatelessWidget {
  const NetworkingPage({Key? key}) : super(key: key);

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
                  'Networking',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Networking in computer science refers to the field that deals with the communication and interconnection of computers and other devices to share resources, exchange data, and enable communication.',
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
                        text: 'Network Engineer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Designs, implements, and maintains computer networks, including hardware and software components.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Systems Administrator: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Manages and troubleshoots IT systems, servers, and network infrastructure.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Network Security Engineer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Focuses on securing network infrastructure and preventing unauthorized access.\n',
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
                  'Cisco Certified Network Associate (CCNA)',
                  'https://www.cisco.com/site/us/en/learn/training-certifications/certifications/enterprise/ccna/index.html',
                ),
                _buildCertificationItem(
                  'CompTIA Network+',
                  'https://www.comptia.org/certifications/network',
                ),
                _buildCertificationItem(
                  'SolarWinds Certified Professional',
                  'https://support.solarwinds.com/solarwinds-certified-professional-program',
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
