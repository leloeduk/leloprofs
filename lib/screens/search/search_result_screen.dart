import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leloprofs/controllers/teacher_search_screen.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherSearchController teacherSearchController = Get.find();
    return Obx(() {
      final teachers = teacherSearchController.filteredTeachers;

      return ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return ListTile(
            title: Text(teacher.fullName),
            subtitle: Text(teacher.educationCycle.join(", ")),
            // Ajoute ici d'autres propriétés que tu veux afficher
          );
        },
      );
    });
  }
}
