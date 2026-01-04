// import 'dart:io' as io;
// import 'dart:html' as html;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import '../../auth/services/database_services.dart';
// import '../../auth/services/teacher_services.dart';
// import '../../models/teacher_model.dart';

// class TeacherFormScreen extends StatefulWidget {
//   final Teacher? teacher;

//   const TeacherFormScreen({super.key, this.teacher});

//   @override
//   State<TeacherFormScreen> createState() => _TeacherFormScreenState();
// }

// class _TeacherFormScreenState extends State<TeacherFormScreen> {
//   final formKey = GlobalKey<FormState>();
//   final TeacherService teacherService = TeacherService();
//   final ImagePicker _picker = ImagePicker();
//   dynamic _image;
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController levelOfStudyController = TextEditingController();
//   final TextEditingController subjectsController = TextEditingController();
//   final TextEditingController yearsOfExperienceController =
//       TextEditingController();
//   final TextEditingController profileImageController = TextEditingController();

//   List<String> cycles = ['Primaire', 'Collège', 'Lycée'];
//   List<String> diplomas = [
//     'BEPC',
//     'BAC',
//     'BAC+1',
//     'BAC+2',
//     'BAC+3',
//     'Masters',
//     'PhD'
//   ];

//   String selectedCycle = 'Primaire';
//   String selectedDiploma = 'BEPC';

//   @override
//   void initState() {
//     super.initState();
//     if (widget.teacher != null) {
//       fullNameController.text = widget.teacher!.fullName;
//       firstNameController.text = widget.teacher!.firstName;
//       levelOfStudyController.text = widget.teacher!.levelOfStudy;
//       subjectsController.text = widget.teacher!.subjects.isNotEmpty
//           ? widget.teacher!.subjects.join(', ')
//           : 'Maths';
//       selectedCycle = widget.teacher!.educationCycle.isNotEmpty
//           ? widget.teacher!.educationCycle[0]
//           : 'Primaire';
//       yearsOfExperienceController.text =
//           widget.teacher!.yearsOfExperience.toString();
//       selectedDiploma = widget.teacher!.diploma;
//       profileImageController.text = widget.teacher!.profileImage;
//       _image = kIsWeb
//           ? widget.teacher!.profileImage
//           : io.File(widget.teacher!.profileImage);
//     }
//   }

//   Future<void> _pickImage() async {
//     if (kIsWeb) {
//       final uploadInput = html.FileUploadInputElement();
//       uploadInput.accept = 'image/*';
//       uploadInput.click();
//       uploadInput.onChange.listen((e) async {
//         final files = uploadInput.files;
//         if (files!.isEmpty) return;
//         final reader = html.FileReader();
//         reader.readAsDataUrl(files[0]);
//         reader.onLoadEnd.listen((e) {
//           setState(() {
//             _image = reader.result as String;
//             profileImageController.text = _image;
//           });
//         });
//       });
//     } else {
//       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _image = io.File(pickedFile.path);
//           profileImageController.text = pickedFile.path;
//         });
//       }
//     }
//   }

//   Future<void> registerTeacher() async {
//     Teacher newTeacher = Teacher(
//       id: FirebaseFirestore.instance.collection('teachers').doc().id,
//       fullName: fullNameController.text,
//       firstName: firstNameController.text,
//       levelOfStudy: levelOfStudyController.text,
//       subjects:
//           subjectsController.text.split(',').map((e) => e.trim()).toList(),
//       educationCycle: [selectedCycle],
//       yearsOfExperience: int.tryParse(yearsOfExperienceController.text) ?? 0,
//       diploma: selectedDiploma,
//       profileImage: profileImageController.text,
//       universitySubjects: [],
//       isAdmin: false,
//     );

//     await DatabaseService().createTeacher(newTeacher).then((_) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Enregistrement réussi'),
//       ));
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Échec de l\'enregistrement : $error'),
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Enregistrement Enseignant'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: _image != null
//                     ? kIsWeb
//                         ? Image.network(_image,
//                             height: 150, width: 150, fit: BoxFit.cover)
//                         : Image.file(_image,
//                             height: 150, width: 150, fit: BoxFit.cover)
//                     : Container(
//                         height: 150,
//                         width: 150,
//                         color: Colors.grey[300],
//                         child:
//                             const Icon(Icons.add_a_photo, color: Colors.grey),
//                       ),
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: fullNameController,
//                 decoration: const InputDecoration(labelText: 'Nom complet'),
//               ),
//               TextFormField(
//                 controller: firstNameController,
//                 decoration: const InputDecoration(labelText: 'Prénom'),
//               ),
//               TextFormField(
//                 controller: levelOfStudyController,
//                 decoration: const InputDecoration(labelText: 'Niveau d\'étude'),
//               ),
//               TextFormField(
//                 controller: subjectsController,
//                 decoration: const InputDecoration(
//                     labelText: 'Matières (séparées par des virgules)'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: selectedCycle,
//                 decoration: const InputDecoration(labelText: 'Cycle'),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCycle = value!;
//                   });
//                 },
//                 items: cycles.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               TextFormField(
//                 controller: yearsOfExperienceController,
//                 keyboardType: TextInputType.number,
//                 decoration:
//                     const InputDecoration(labelText: 'Années d\'expérience'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: selectedDiploma,
//                 decoration: const InputDecoration(labelText: 'Diplôme'),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedDiploma = value!;
//                   });
//                 },
//                 items: diplomas.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     await registerTeacher();
//                     Get.offAllNamed('/admin');
//                   }
//                 },
//                 child: const Text('Enregistrer'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
