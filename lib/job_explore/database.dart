import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required to open URLs

class DatabasePage extends StatelessWidget {
  const DatabasePage({Key? key}) : super(key: key);

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
                  'Database Systems',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Database Systems is a field in computer science that focuses on the study, design, implementation, and management of databases.',
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
                        text: 'Database Administrator (DBA): ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Manages and maintains databases, including performance tuning and security.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Database Developer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Creates and optimizes database queries, stored procedures, and data models.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Data Engineer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Designs, builds, and maintains data pipelines and infrastructure for storing and processing data.\n',
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
                  'Meta Database Engineer Professional Certificate',
                  'https://www.coursera.org/professional-certificates/meta-database-engineer',
                ),
                _buildCertificationItem(
                  'Microsoft Certified: Azure Database Administrator Associate',
                  'https://learn.microsoft.com/en-us/credentials/certifications/azure-database-administrator-associate/?practice-assessment-type=certification',
                ),
                _buildCertificationItem(
                  'Oracle Certified Expert',
                  'https://education.oracle.com/oracle-certification-exams-list?regularExams',
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
