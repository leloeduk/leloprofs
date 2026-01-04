// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../data/controllers/teacher_controller.dart';
// import '../../models/teacher_model.dart';

// class UpdateTeacherScreen extends StatelessWidget {
//   final TeacherController teacherController = Get.find();
//   final Teacher teacher;

//   UpdateTeacherScreen({super.key, required this.teacher});

//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController levelOfStudyController = TextEditingController();
//   final TextEditingController subjectsController = TextEditingController();
//   final TextEditingController universitySubjectsController =
//       TextEditingController();
//   final TextEditingController educationCycleController =
//       TextEditingController();
//   final TextEditingController yearsOfExperienceController =
//       TextEditingController();
//   final TextEditingController diplomaController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Initialisation des contrôleurs avec les valeurs actuelles de l'enseignant
//     fullNameController.text = teacher.fullName;
//     firstNameController.text = teacher.firstName;
//     levelOfStudyController.text = teacher.levelOfStudy;
//     subjectsController.text = teacher.subjects.join(', ');
//     universitySubjectsController.text = teacher.universitySubjects.join(', ');
//     educationCycleController.text = teacher.educationCycle.first;
//     yearsOfExperienceController.text = teacher.yearsOfExperience.toString();
//     diplomaController.text = teacher.diploma;
//     phoneNumberController.text = teacher.phoneNumber;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Mettre à Jour l’Enseignant')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: fullNameController,
//               decoration: const InputDecoration(labelText: 'Nom Complet'),
//             ),
//             TextField(
//               controller: firstNameController,
//               decoration: const InputDecoration(labelText: 'Prénom'),
//             ),
//             TextField(
//               controller: levelOfStudyController,
//               decoration: const InputDecoration(labelText: 'Niveau d’Études'),
//             ),
//             TextField(
//               controller: subjectsController,
//               decoration: const InputDecoration(
//                   labelText: 'Matières Enseignées (séparées par des virgules)'),
//             ),
//             TextField(
//               controller: universitySubjectsController,
//               decoration: const InputDecoration(
//                   labelText:
//                       'Matières Universitaires (séparées par des virgules)'),
//             ),
//             TextField(
//               controller: educationCycleController,
//               decoration: const InputDecoration(labelText: 'Cycle d’Éducation'),
//             ),
//             TextField(
//               controller: yearsOfExperienceController,
//               decoration:
//                   const InputDecoration(labelText: 'Années d’Expérience'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: diplomaController,
//               decoration: const InputDecoration(labelText: 'Diplôme'),
//             ),
//             TextField(
//               controller: phoneNumberController,
//               decoration:
//                   const InputDecoration(labelText: 'Numéro de Téléphone'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final updatedTeacher = teacher.copyWith(
//                   fullName: fullNameController.text,
//                   firstName: firstNameController.text,
//                   levelOfStudy: levelOfStudyController.text,
//                   subjects: subjectsController.text.isNotEmpty
//                       ? subjectsController.text
//                           .split(',')
//                           .map((e) => e.trim())
//                           .toList()
//                       : [],
//                   universitySubjects:
//                       universitySubjectsController.text.isNotEmpty
//                           ? universitySubjectsController.text
//                               .split(',')
//                               .map((e) => e.trim())
//                               .toList()
//                           : [],
//                   educationCycle: educationCycleController.text,
//                   yearsOfExperience:
//                       int.tryParse(yearsOfExperienceController.text) ?? 0,
//                   diploma: diplomaController.text,
//                   phoneNumber: phoneNumberController.text,
//                 );

//                 teacherController.updateTeacher(updatedTeacher);
//                 Get.back(); // Retourner à l'écran précédent
//               },
//               child: const Text('Mettre à Jour Enseignant'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
