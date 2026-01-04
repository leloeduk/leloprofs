import 'package:flutter/material.dart';

import '../../../models/teacher_model.dart';
import '../../components/custom_container.dart';

class CardTeacher extends StatelessWidget {
  const CardTeacher({super.key, required this.teacher});
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.green,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(teacher.fullName.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
            Text(
              " ${teacher.firstName}   ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            )
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  title: "Matière",
                  text: teacher.subjects[0],
                  color: Colors.green.shade200,
                ),
                CustomContainer(
                  title: "Diplome",
                  text: teacher.diploma,
                  color: Colors.red.shade200,
                ),
                CustomContainer(
                  title: "Cycle",
                  text: teacher.educationCycle[0],
                  color: Colors.green.shade200,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.school,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                    Text(teacher.yearsOfExperience.toString())
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.date_range,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                    Text(teacher.teachingDuration)
                  ],
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.person,
            color: Colors.green,
            size: 50,
          ),
        ),
        onTap: () {
          // Action on tap if needed
          // Get.to(TeacherDetailScreen(
          //   teacher: teacher,
          // ));
        },
      ),
    );
  }
}
