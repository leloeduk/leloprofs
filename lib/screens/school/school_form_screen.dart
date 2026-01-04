// import 'dart:io' as io;
// import 'dart:html' as html;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../auth/services/database_services.dart';
// import '../../models/school_model.dart';

// class RegisterSchoolScreen extends StatefulWidget {
//   const RegisterSchoolScreen({super.key});

//   @override
//   State<RegisterSchoolScreen> createState() => _RegisterSchoolScreenState();
// }

// class _RegisterSchoolScreenState extends State<RegisterSchoolScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _contactNumberController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _profileImageController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   dynamic _image;

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
//             _profileImageController.text = _image;
//           });
//         });
//       });
//     } else {
//       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _image = io.File(pickedFile.path);
//           _profileImageController.text = pickedFile.path;
//         });
//       // }
//     }
//   }

//   Future<void> registerSchool() async {
//     School school = School(
//       id: FirebaseAuth.instance.currentUser!.uid,
//       name: _nameController.text,
//       address: _addressController.text,
//       phoneNumber: _contactNumberController.text,
//       email: _emailController.text,
//       profileImage: _profileImageController.text,
//       jobPosts: [],
//     );
//     await DatabaseService().createSchool(school).then((_) {
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
//       appBar: AppBar(title: const Text('Enregistrer École')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
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
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Nom'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Veuillez entrer le nom de l\'école';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: const InputDecoration(labelText: 'Adresse'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Veuillez entrer l\'adresse';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _contactNumberController,
//                 decoration:
//                     const InputDecoration(labelText: 'Numéro de contact'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Veuillez entrer le numéro de contact';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Veuillez entrer l\'email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _profileImageController,
//                 decoration: const InputDecoration(
//                     labelText: 'URL de l\'image de profil'),
//                 enabled: false,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     await registerSchool();
//                     Navigator.pop(context); // Retourne à l'écran précédent
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
