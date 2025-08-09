import 'package:flutter/material.dart';
import 'package:second_task/pages/summary_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userNameController = TextEditingController();
  final ageController = TextEditingController();
  final majorController = TextEditingController();

  final List<String> courses = ['CCNA', 'C++', 'C#', 'Unity'];
  String? selectedCourse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'User name'),
              controller: userNameController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Age'),
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Major'),
              controller: majorController,
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Course',
                border: OutlineInputBorder(),
              ),
              value: selectedCourse,
              items:
                  courses.map((course) {
                    return DropdownMenuItem<String>(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final userName = userNameController.text.trim();
                final userAge = ageController.text.trim();
                final userMajor = majorController.text.trim();
                final userCourse = selectedCourse ?? 'Not selected';

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SummaryPage(
                          userName: userName,
                          userAge: userAge,
                          userMajor: userMajor,
                          userCourse: userCourse,
                        ),
                  ),
                );
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
