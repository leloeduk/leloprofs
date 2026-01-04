import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/teacher_search_screen.dart';
import '../../models/teacher_model.dart';

class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherSearchController teacherController = Get.find();

    // Variables pour stocker les options sélectionnées
    String? selectedDepartment;
    String? selectedDiploma;
    String? selectedTeachingDuration;
    String? selectedEducationCycle;
    String? selectedSubject;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Menus déroulants pour les filtres de recherche
          _buildDropdown(
            hint: "Select Department",
            value: selectedDepartment,
            items: departmentsList,
            onChanged: (newValue) {
              selectedDepartment = newValue;
            },
          ),
          _buildDropdown(
            hint: "Select Diploma",
            value: selectedDiploma,
            items: diplomaList,
            onChanged: (newValue) {
              selectedDiploma = newValue;
            },
          ),
          _buildDropdown(
            hint: "Select Teaching Duration",
            value: selectedTeachingDuration,
            items: teachingDurationList,
            onChanged: (newValue) {
              selectedTeachingDuration = newValue;
            },
          ),
          _buildDropdown(
            hint: "Select Education Cycle",
            value: selectedEducationCycle,
            items: educationCycleList,
            onChanged: (newValue) {
              selectedEducationCycle = newValue;
            },
          ),
          _buildDropdown(
            hint: "Select Subject",
            value: selectedSubject,
            items: subjectsList,
            onChanged: (newValue) {
              selectedSubject = newValue;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              teacherController.searchTeachers(
                department: selectedDepartment,
                diploma: selectedDiploma,
                teachingDuration: selectedTeachingDuration,
                educationCycle: selectedEducationCycle,
                subject: selectedSubject,
              );
              Navigator.of(context).pop(); // Fermer le modal
            },
            child: const Text("Search"),
          ),
        ],
      ),
    );
  }

  // Méthode utilitaire pour créer des DropdownButton
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButton<String>(
      hint: Text(hint),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
