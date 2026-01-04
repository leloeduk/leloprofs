// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controllers/teacher_controller.dart';
// import '../../home/widgets/card_teacher.dart';

// class TeacherList extends StatelessWidget {
//   const TeacherList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TeacherController teacherController = Get.put(TeacherController());
//     return Obx(() {
//       if (teacherController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       } else if (teacherController.errorMessage.isNotEmpty) {
//         return Center(child: Text(teacherController.errorMessage.value));
//       } else if (teacherController.teachers.isEmpty) {
//         return const Center(child: Text('Aucun enseignant trouvé.'));
//       } else {
//         return ListView.builder(
//           itemCount: teacherController.teachers.length,
//           itemBuilder: (context, index) {
//             final teacher = teacherController.teachers[index];
//             return CardTeacher(
//               teacher: teacher,
//             );
//           },
//         );
//       }
//     });
//   }
// }
