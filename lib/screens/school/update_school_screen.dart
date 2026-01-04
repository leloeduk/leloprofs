// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../data/controllers/school_controller.dart';
// import '../../models/school_model.dart';

// class UpdateSchoolScreen extends StatelessWidget {
//   final SchoolController schoolController = Get.find();
//   final School school;

//   UpdateSchoolScreen({super.key, required this.school});

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController profileImageController = TextEditingController();
//   final TextEditingController websiteController = TextEditingController();
//   final TextEditingController establishedYearController =
//       TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController principalNameController = TextEditingController();
//   final TextEditingController departmentsController = TextEditingController();
//   final TextEditingController ratingsController = TextEditingController();
//   final TextEditingController educationCycleController =
//       TextEditingController(); // Nouveau champ

//   @override
//   Widget build(BuildContext context) {
//     // Initialisation des contrôleurs avec les valeurs actuelles de l'école
//     nameController.text = school.name;
//     addressController.text = school.address;
//     emailController.text = school.email;
//     phoneNumberController.text = school.phoneNumber;
//     profileImageController.text = school.profileImage;
//     websiteController.text = school.website ?? '';
//     establishedYearController.text = school.establishedYear?.toString() ?? '';
//     typeController.text = school.type ?? '';
//     principalNameController.text = school.principalName ?? '';
//     departmentsController.text = school.departments?.join(', ') ?? '';
//     ratingsController.text = school.ratings?.toString() ?? '';
//     educationCycleController.text = (school.educationCycle ?? []).join(', ');

//     return Scaffold(
//       appBar: AppBar(title: const Text('Mettre à Jour l’École')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Autres champs...
//             TextField(
//               controller: educationCycleController,
//               decoration: const InputDecoration(
//                   labelText: 'Cycle d\'Éducation (séparés par des virgules)'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final updatedSchool = school.copyWith(
//                   name: nameController.text,
//                   address: addressController.text,
//                   email: emailController.text,
//                   phoneNumber: phoneNumberController.text,
//                   profileImage: profileImageController.text,
//                   website: websiteController.text.isNotEmpty
//                       ? websiteController.text
//                       : null,
//                   establishedYear: establishedYearController.text.isNotEmpty
//                       ? int.tryParse(establishedYearController.text)
//                       : null,
//                   type: typeController.text,
//                   principalName: principalNameController.text,
//                   departments: departmentsController.text.isNotEmpty
//                       ? departmentsController.text
//                           .split(',')
//                           .map((e) => e.trim())
//                           .toList()
//                       : [],
//                   ratings: ratingsController.text.isNotEmpty
//                       ? double.tryParse(ratingsController.text)
//                       : null,
//                   educationCycle: educationCycleController.text.isNotEmpty
//                       ? educationCycleController.text
//                           .split(',')
//                           .map((e) => e.trim())
//                           .toList()
//                       : [],
//                 );

//                 schoolController.updateSchool(updatedSchool);
//                 Get.back(); // Retourner à l'écran précédent
//               },
//               child: const Text('Mettre à Jour École'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
