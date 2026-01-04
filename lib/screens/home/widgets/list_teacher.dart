import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/custom_container_teacher.dart';

class ListTeacher extends StatelessWidget {
  const ListTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('teachers').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("Aucun enseignant trouvé"));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var teacher =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;

            return Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Réduction du padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(teacher['profileImage']),
                          radius: 25, // Réduction de la taille de l'avatar
                        ),
                        const SizedBox(
                            width: 12.0), // Réduction de l'espace horizontal
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teacher['fullName'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0, // Texte plus petit
                              ),
                            ),
                            Text(
                              teacher['bio'],
                              style: const TextStyle(
                                fontSize:
                                    12.0, // Réduction de la taille du texte
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 10.0), // Réduction de l'espace vertical

                    // Utilisation de Wrap pour organiser les CustomContainerTeacher
                    Wrap(
                      spacing: 8.0, // Espacement réduit
                      runSpacing: 8.0,
                      children: [
                        CustomContainerTeacher(
                          title: "Matière",
                          text: teacher['subjects'][0],
                          color: Colors.green.shade200,
                        ),
                        CustomContainerTeacher(
                          title: "Diplôme",
                          text: teacher['diploma'],
                          color: Colors.red.shade200,
                        ),
                        CustomContainerTeacher(
                          title: "Cycle",
                          text: teacher['educationCycle'][0],
                          color: Colors.blue.shade200,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8), // Réduction de l'espace vertical
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.school,
                                color: Colors.green, size: 18),
                            const SizedBox(width: 5),
                            Text(
                              teacher['yearsOfExperience'].toString(),
                              style: const TextStyle(
                                  fontSize: 12.0), // Texte plus petit
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.date_range,
                                color: Colors.blue, size: 18),
                            const SizedBox(width: 5),
                            Text(
                              teacher['teachingDuration'],
                              style: const TextStyle(
                                  fontSize: 12.0), // Texte plus petit
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
