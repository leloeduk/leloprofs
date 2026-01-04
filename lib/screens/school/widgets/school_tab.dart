import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/school_controller.dart';

class SchoolTab extends StatelessWidget {
  const SchoolTab({super.key});

  @override
  Widget build(BuildContext context) {
    final SchoolController schoolController = Get.find();
    return Obx(() {
      if (schoolController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (schoolController.errorMessage.isNotEmpty) {
        return Center(child: Text(schoolController.errorMessage.value));
      } else if (schoolController.schools.isEmpty) {
        return const Center(child: Text('Aucune école trouvée.'));
      } else {
        return ListView.builder(
          itemCount: schoolController.schools.length,
          itemBuilder: (context, index) {
            final school = schoolController.schools[index];
            return ListTile(
              title: Text(school.name),
              subtitle: Text(school.address),
            );
          },
        );
      }
    });
  }
}
