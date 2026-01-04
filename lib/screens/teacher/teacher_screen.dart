import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/teacher_controller.dart';
import '../../../models/teacher_model.dart';

class TeacherListScreen extends StatelessWidget {
  const TeacherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherController teacherController = Get.put(TeacherController());

    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: StreamBuilder<List<Teacher>>(
        stream: teacherController.getTeachersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No teachers available'));
          } else {
            final teachers = snapshot.data!;
            return ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final teacher = teachers[index];
                return ListTile(
                  title: Text(teacher.fullName),
                  subtitle: Text(teacher.firstName),
                  // Ajoutez d'autres informations selon vos besoins
                );
              },
            );
          }
        },
      ),
    );
  }
}
