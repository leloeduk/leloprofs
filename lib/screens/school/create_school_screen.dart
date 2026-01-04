// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:leloschool/data/controllers/school_controller.dart';

// import '../../models/school_model.dart';

// class CreateSchoolScreen extends StatefulWidget {
//   final School? school;

//   const CreateSchoolScreen({super.key, this.school});

//   @override
//   State<CreateSchoolScreen> createState() => _CreateSchoolScreenState();
// }

// class _CreateSchoolScreenState extends State<CreateSchoolScreen> {
//   final SchoolController schoolController = Get.put(SchoolController());
//   late TextEditingController nameController;
//   late TextEditingController addressController;
//   late TextEditingController emailController;
//   late TextEditingController phoneNumberController;
//   late TextEditingController profileImageController;
//   late TextEditingController websiteController;
//   late TextEditingController establishedYearController;
//   late TextEditingController typeController;
//   late TextEditingController principalNameController;
//   late TextEditingController departmentsController;
//   late TextEditingController educationCycleController;
//   late TextEditingController ratingsController;

//   @override
//   void initState() {
//     super.initState();

//     // Initializing controllers with values from the School model if available
//     final school = widget.school;
//     nameController = TextEditingController(text: school?.name ?? '');
//     addressController = TextEditingController(text: school?.address ?? '');
//     emailController = TextEditingController(text: school?.email ?? '');
//     phoneNumberController =
//         TextEditingController(text: school?.phoneNumber ?? '');
//     profileImageController =
//         TextEditingController(text: school?.profileImage ?? '');
//     websiteController = TextEditingController(text: school?.website ?? '');
//     establishedYearController =
//         TextEditingController(text: school?.establishedYear?.toString() ?? '');
//     typeController = TextEditingController(text: school?.type ?? '');
//     principalNameController =
//         TextEditingController(text: school?.principalName ?? '');
//     departmentsController =
//         TextEditingController(text: school?.departments?.join(', ') ?? '');
//     educationCycleController =
//         TextEditingController(text: school?.educationCycle?.join(', ') ?? '');
//     ratingsController =
//         TextEditingController(text: school?.ratings?.toString() ?? '');
//   }

//   @override
//   void dispose() {
//     // Dispose of controllers when the widget is removed
//     nameController.dispose();
//     addressController.dispose();
//     emailController.dispose();
//     phoneNumberController.dispose();
//     profileImageController.dispose();
//     websiteController.dispose();
//     establishedYearController.dispose();
//     typeController.dispose();
//     principalNameController.dispose();
//     departmentsController.dispose();
//     educationCycleController.dispose();
//     ratingsController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Créer une École')),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 _buildTextField(controller: nameController, label: 'Name'),
//                 _buildTextField(
//                     controller: addressController, label: 'Address'),
//                 _buildTextField(controller: emailController, label: 'Email'),
//                 _buildTextField(
//                     controller: phoneNumberController, label: 'Phone Number'),
//                 _buildTextField(
//                     controller: profileImageController,
//                     label: 'Profile Image URL'),
//                 _buildTextField(
//                     controller: websiteController, label: 'Website'),
//                 _buildTextField(
//                     controller: establishedYearController,
//                     label: 'Established Year'),
//                 _buildTextField(controller: typeController, label: 'Type'),
//                 _buildTextField(
//                     controller: principalNameController,
//                     label: 'Principal Name'),
//                 _buildTextField(
//                     controller: departmentsController,
//                     label: 'Departments (comma-separated)'),
//                 _buildTextField(
//                     controller: educationCycleController,
//                     label: 'Education Cycle (comma-separated)'),
//                 _buildTextField(
//                     controller: ratingsController, label: 'Ratings'),
//                 TextField(
//                   controller: educationCycleController,
//                   decoration: const InputDecoration(
//                       labelText:
//                           'Cycle d\'Éducation (séparés par des virgules)'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final school = School(
//                       id: DateTime.now()
//                           .toIso8601String(), // ID unique temporaire
//                       name: nameController.text,
//                       address: addressController.text,
//                       email: emailController.text,
//                       phoneNumber: phoneNumberController.text,
//                       profileImage: profileImageController.text,
//                       jobPosts: [], // Valeur par défaut ou selon les besoins
//                       website: websiteController.text.isNotEmpty
//                           ? websiteController.text
//                           : null,
//                       establishedYear: establishedYearController.text.isNotEmpty
//                           ? int.tryParse(establishedYearController.text)
//                           : null,
//                       type: typeController.text,
//                       principalName: principalNameController.text,
//                       departments: departmentsController.text.isNotEmpty
//                           ? departmentsController.text
//                               .split(',')
//                               .map((e) => e.trim())
//                               .toList()
//                           : [],
//                       ratings: ratingsController.text.isNotEmpty
//                           ? double.tryParse(ratingsController.text)
//                           : null,
//                       educationCycle: educationCycleController.text.isNotEmpty
//                           ? educationCycleController.text
//                               .split(',')
//                               .map((e) => e.trim())
//                               .toList()
//                           : [],
//                     );

//                     await schoolController.createSchool(school);
//                     Get.back(); // Retourner à l'écran précédent
//                   },
//                   child: const Text('Créer École'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
