import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String userName;
  final String userAge;
  final String userMajor;
  final String userCourse; 

  const SummaryPage({
    super.key,
    required this.userName,
    required this.userAge,
    required this.userMajor,
    required this.userCourse, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User Name: $userName'),
            Text('Age: $userAge'),
            Text('Major: $userMajor'),
            Text('Course: $userCourse'), 
          ],
        ),
      ),
    );
  }
}
