// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../data/controllers/school_controller.dart';
// import '../../models/school_model.dart';

// class SchoolEditScreen extends StatelessWidget {
//   final SchoolController schoolController = Get.find();
//   final School? school;

//   SchoolEditScreen({super.key, this.school});

//   @override
//   Widget build(BuildContext context) {
//     final nameController = TextEditingController(text: school?.name ?? '');
//     final addressController =
//         TextEditingController(text: school?.address ?? '');
//     final emailController = TextEditingController(text: school?.email ?? '');
//     final phoneNumberController =
//         TextEditingController(text: school?.phoneNumber ?? '');
//     final profileImageController =
//         TextEditingController(text: school?.profileImage ?? '');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(school == null ? 'Ajouter une École' : 'Éditer École'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Nom'),
//             ),
//             TextField(
//               controller: addressController,
//               decoration: const InputDecoration(labelText: 'Adresse'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: phoneNumberController,
//               decoration:
//                   const InputDecoration(labelText: 'Numéro de Téléphone'),
//             ),
//             TextField(
//               controller: profileImageController,
//               decoration: const InputDecoration(labelText: 'Image de Profil'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final newSchool = School(
//                   id: school?.id ?? DateTime.now().toString(),
//                   name: nameController.text,
//                   address: addressController.text,
//                   email: emailController.text,
//                   phoneNumber: phoneNumberController.text,
//                   profileImage: profileImageController.text,
//                 );

//                 if (school == null) {
//                   schoolController.createSchool(newSchool);
//                 } else {
//                   schoolController.updateSchool(newSchool);
//                 }

//                 Get.back();
//               },
//               child: Text(school == null ? 'Créer' : 'Mettre à Jour'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
