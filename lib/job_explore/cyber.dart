import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required to open URLs

class CyberPage extends StatelessWidget {
  const CyberPage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                  'Cybersecurity',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Cybersecurity is the practice of protecting computer systems, networks, devices, and data from unauthorized access, cyberattacks, data breaches, and other malicious activities.',
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
                        text: 'Cybersecurity Analyst: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Monitors and protects computer systems and networks from cyber threats and attacks.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Ethical Hacker (Penetration Tester): ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Identifies and exploits vulnerabilities in systems to improve security.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Security Consultant: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Advises organizations on security best practices and implements security measures.\n',
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
                  'Certified Information Systems Security Professional (CISSP)',
                  'https://www.pluralsight.com/cloud-guru/courses/certified-information-systems-security-professional-cissp?',
                ),
                _buildCertificationItem(
                  'Certified Ethical Hacker (CEH) by EC-Council',
                  'https://www.eccouncil.org/train-certify/certified-ethical-hacker-ceh/',
                ),
                _buildCertificationItem(
                  'Certified Information Security Manager (CISM)',
                  'https://www.isaca.org/credentialing/cism#certify',
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
}
