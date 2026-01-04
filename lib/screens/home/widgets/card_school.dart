import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/school_model.dart';
import '../../school/school_detail.dart';

class CardSchool extends StatelessWidget {
  const CardSchool({super.key, required this.school});
  final School school;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.red,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(school.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Adresse: ${school.address}'),
        leading: const Icon(Icons.school, color: Colors.green),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
        onTap: () {
          // Action on tap if needed
          Get.to(SchoolDetailScreen(
            school: school,
          ));
        },
      ),
    );
  }
}
