// import 'package:flutter/material.dart';
// import '../../models/teacher_model.dart';

// class TeacherDetailScreen extends StatelessWidget {
//   final Teacher teacher;

//   const TeacherDetailScreen({super.key, required this.teacher});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(teacher.fullName),
//         backgroundColor: Colors.red.shade900,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(teacher.profileImage),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: const BorderRadius.vertical(
//                       bottom: Radius.circular(20),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16,
//                   left: 16,
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(teacher.profileImage),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     teacher.fullName,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     teacher.levelOfStudy,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   _buildInfoRow(Icons.phone, teacher.phoneNumber),
//                   _buildInfoRow(Icons.school, 'Diplôme: ${teacher.diploma}'),
//                   _buildInfoRow(Icons.calendar_today,
//                       'Années d\'expérience: ${teacher.yearsOfExperience}'),
//                   const SizedBox(height: 20),
//                   const Divider(),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Matières enseignées',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...teacher.subjects.map((subject) => Card(
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         child: ListTile(
//                           title: Text(subject),
//                           leading: Icon(Icons.book, color: Colors.red.shade900),
//                         ),
//                       )),
//                   const SizedBox(height: 20),
//                   const Divider(),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Matières universitaires enseignées',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...teacher.universitySubjects.map((subject) => Card(
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         child: ListTile(
//                           title: Text(subject),
//                           leading: Icon(Icons.book, color: Colors.red.shade900),
//                         ),
//                       )),
//                   const SizedBox(height: 20),
//                   const Divider(),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Cycle d\'éducation',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ...teacher.educationCycle.map((cycle) => Card(
//                         margin: const EdgeInsets.symmetric(vertical: 4),
//                         child: ListTile(
//                           title: Text(cycle),
//                           leading:
//                               Icon(Icons.school, color: Colors.red.shade900),
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.red.shade900),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
