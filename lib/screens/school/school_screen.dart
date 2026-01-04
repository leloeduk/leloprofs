// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:leloschool/screens/school/school_detail_screen.dart';
// import '../../models/school_model.dart';

// class SchoolScreen extends StatelessWidget {
//   const SchoolScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //  final teacherService = Provider.of<DatabaseService>(context);
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('schools').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No Schools Found'));
//           }
//           final schools = snapshot.data!.docs.map((doc) {
//             final data = doc.data() as Map<String, dynamic>;
//             return School.fromMap(data, doc.id);
//           }).toList();
//           return ListView.builder(
//             itemCount: schools.length,
//             itemBuilder: (context, index) {
//               final school = schools[index];
//               return ListTile(
//                 title: Text(school.name),
//                 subtitle: Text(school.address),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             SchoolDetailScreen(school: school),
//                       ));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
