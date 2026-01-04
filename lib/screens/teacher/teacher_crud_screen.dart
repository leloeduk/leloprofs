import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/teacher_controller.dart';
import 'teacher_edit_screen.dart';

class TeacherCrudScreen extends StatelessWidget {
  const TeacherCrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherController teacherController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enseignants'),
      ),
      body: Obx(() {
        if (teacherController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (teacherController.errorMessage.isNotEmpty) {
          return Center(child: Text(teacherController.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: teacherController.teachers.length,
            itemBuilder: (context, index) {
              final teacher = teacherController.teachers[index];
              return ListTile(
                title: Text(teacher.fullName),
                subtitle: Text(teacher.teachingDuration),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Get.to(TeacherEditScreen(teacher: teacher));
                  },
                ),
                onLongPress: () {
                  teacherController.deleteTeacher(teacher.id);
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TeacherEditScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
