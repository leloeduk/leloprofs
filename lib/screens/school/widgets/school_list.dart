import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/school_controller.dart';
import '../../home/widgets/card_school.dart';

class SchoolList extends StatelessWidget {
  const SchoolList({super.key});

  @override
  Widget build(BuildContext context) {
    final SchoolController schoolController = Get.put(SchoolController());
    return Obx(() {
      if (schoolController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (schoolController.errorMessage.isNotEmpty) {
        return Center(child: Text(schoolController.errorMessage.value));
      } else if (schoolController.schools.isEmpty) {
        return const Center(child: Text('Aucun enseignant trouvé.'));
      } else {
        return ListView.builder(
          itemCount: schoolController.schools.length,
          itemBuilder: (context, index) {
            final school = schoolController.schools[index];
            return CardSchool(school: school);
          },
        );
      }
    });
  }
}
