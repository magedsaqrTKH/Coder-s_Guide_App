import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importing url_launcher

class SoftwarePage extends StatelessWidget {
  const SoftwarePage({Key? key}) : super(key: key);

  Future<void> _openLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print('Could not open $url');
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
                  'Software Development',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Software development is the process of creating, designing, implementing, and maintaining software applications or systems. It involves a series of steps or stages that typically include planning, analysis, design, implementation, testing, deployment, and maintenance.',
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
                        text: 'Software Engineer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Develops and maintains software applications, systems, and platforms.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Application Developer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Creates software applications for specific platforms or purposes.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Full-Stack Developer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Works on both front-end and back-end development of web applications.\n',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: '• ',
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Mobile App Developer: ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Specializes in creating applications for mobile devices, such as smartphones and tablets.\n',
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
                  'CompTIA IT Fundamentals',
                  'https://www.comptia.org/certifications/it-fundamentals',
                ),
                _buildCertificationItem(
                  'IEEE Professional Software Developer',
                  'https://www.computer.org/product/education/professional-software-developer-certification',
                ),
                _buildCertificationItem(
                  'AWS Certified Developer',
                  'https://aws.amazon.com/certification/certified-developer-associate/',
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
      onTap: () => _openLink(url), // Open the given URL when tapped
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
