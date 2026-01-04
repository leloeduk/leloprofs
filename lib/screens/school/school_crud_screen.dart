// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:leloschool/screens/school/school_edit_screen.dart';
// import '../../data/controllers/school_controller.dart';

// class SchoolCrudScreen extends StatelessWidget {
//   const SchoolCrudScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final SchoolController schoolController = Get.find();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Écoles'),
//       ),
//       body: Obx(() {
//         if (schoolController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (schoolController.errorMessage.isNotEmpty) {
//           return Center(child: Text(schoolController.errorMessage.value));
//         } else {
//           return ListView.builder(
//             itemCount: schoolController.schools.length,
//             itemBuilder: (context, index) {
//               final school = schoolController.schools[index];
//               return ListTile(
//                 title: Text(school.name),
//                 subtitle: Text(school.address),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () {
//                     Get.to(SchoolEditScreen(school: school));
//                   },
//                 ),
//                 onLongPress: () {
//                   schoolController.deleteSchool(school.id);
//                 },
//               );
//             },
//           );
//         }
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(SchoolEditScreen());
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
