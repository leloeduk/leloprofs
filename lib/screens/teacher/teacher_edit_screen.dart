import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/teacher_controller.dart';
import '../../models/teacher_model.dart';

class TeacherEditScreen extends StatelessWidget {
  final TeacherController teacherController = Get.find();
  final Teacher? teacher;

  TeacherEditScreen({super.key, this.teacher});

  @override
  Widget build(BuildContext context) {
    final fullNameController =
        TextEditingController(text: teacher?.fullName ?? '');
    final firstNameController =
        TextEditingController(text: teacher?.firstName ?? '');
    final teachingDurationController =
        TextEditingController(text: teacher?.teachingDuration ?? '');
    final subjectsController =
        TextEditingController(text: teacher?.subjects.join(', ') ?? '');
    final universitySubjectsController = TextEditingController(
        text: teacher?.universitySubjects.join(', ') ?? '');
    final educationCycleController =
        TextEditingController(text: teacher?.educationCycle.join(', ') ?? '');
    final yearsOfExperienceController = TextEditingController(
        text: teacher?.yearsOfExperience.toString() ?? '');
    final diplomaController =
        TextEditingController(text: teacher?.diploma ?? '');
    final profileImageController =
        TextEditingController(text: teacher?.profileImage ?? '');
    final phoneNumberController =
        TextEditingController(text: teacher?.phoneNumber ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
            teacher == null ? 'Ajouter un Enseignant' : 'Éditer Enseignant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Nom Complet'),
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: teachingDurationController,
              decoration: const InputDecoration(labelText: 'Niveau d\'Étude'),
            ),
            TextField(
              controller: subjectsController,
              decoration:
                  const InputDecoration(labelText: 'Matières En enseignées'),
            ),
            TextField(
              controller: universitySubjectsController,
              decoration:
                  const InputDecoration(labelText: 'Matières Universitaires'),
            ),
            TextField(
              controller: educationCycleController,
              decoration:
                  const InputDecoration(labelText: 'Cycle d\'Éducation'),
            ),
            TextField(
              controller: yearsOfExperienceController,
              decoration:
                  const InputDecoration(labelText: 'Années d\'Expérience'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: diplomaController,
              decoration: const InputDecoration(labelText: 'Diplôme'),
            ),
            TextField(
              controller: profileImageController,
              decoration: const InputDecoration(labelText: 'Image de Profil'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration:
                  const InputDecoration(labelText: 'Numéro de Téléphone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTeacher = Teacher(
                  id: teacher?.id ?? DateTime.now().toString(),
                  fullName: fullNameController.text,
                  firstName: firstNameController.text,
                  teachingDuration: teachingDurationController.text,
                  subjects: subjectsController.text
                      .split(',')
                      .map((s) => s.trim())
                      .toList(),
                  universitySubjects: universitySubjectsController.text
                      .split(',')
                      .map((s) => s.trim())
                      .toList(),
                  educationCycle: educationCycleController.text
                      .split(',')
                      .map((s) => s.trim())
                      .toList(),
                  yearsOfExperience:
                      int.parse(yearsOfExperienceController.text),
                  diploma: diplomaController.text,
                  profileImage: profileImageController.text,
                  phoneNumber: phoneNumberController.text,
                );

                if (teacher == null) {
                  teacherController.addTeacher(newTeacher);
                } else {
                  teacherController.updateTeacher(newTeacher);
                }

                Get.back();
              },
              child: Text(teacher == null ? 'Créer' : 'Mettre à Jour'),
            ),
          ],
        ),
      ),
    );
  }
}
