import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/school_model.dart';
import '../../school/school_profile_screen.dart';

class ListSchool extends StatelessWidget {
  const ListSchool({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> schoolsStream =
        FirebaseFirestore.instance.collection('schools').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: schoolsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text("Une erreur s'est produite : ${snapshot.error}"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final schools = snapshot.data?.docs ?? [];

        if (schools.isEmpty) {
          return const Center(child: Text("Aucune école disponible"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: schools.length,
          itemBuilder: (context, index) {
            final schoolData = schools[index].data() as Map<String, dynamic>;
            final school = School.fromMap(schoolData, schools[index].id);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SchoolProfileScreen(school: school)),
                );
              },
              child: CardSchool(school: school),
            );
          },
        );
      },
    );
  }
}

class CardSchool extends StatelessWidget {
  final School school;
  const CardSchool({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Réduit les marges internes
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: school.profileImage != null
                      ? NetworkImage(school.profileImage!)
                      : null,
                  radius: 25, // Réduit la taille de l'avatar
                  child: school.profileImage == null
                      ? const Icon(Icons.school, size: 25)
                      : null,
                ),
                const SizedBox(width: 12.0), // Réduit l'espace horizontal
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      school.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0, // Réduit la taille du texte du nom
                      ),
                    ),
                    Text(
                      school.address,
                      style: const TextStyle(
                        fontSize:
                            12.0, // Réduit la taille du texte de l'adresse
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // Utilisation de Wrap pour les cycles éducatifs et types d'école
            Wrap(
              spacing: 8.0, // Réduit l'espacement entre les éléments
              runSpacing: 8.0,
              children: [
                CustomContainer(
                  title: "Cycle",
                  text: school.educationCycle[0],
                  color: Colors.green.shade200,
                ),
                CustomContainer(
                  title: "Type",
                  text: school.types[0],
                  color: Colors.blue.shade200,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.green, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      school.phoneNumber,
                      style:
                          const TextStyle(fontSize: 12.0), // Texte plus petit
                    ),
                  ],
                ),
                if (school.ratings != null)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        school.ratings!.toStringAsFixed(1),
                        style:
                            const TextStyle(fontSize: 12.0), // Texte plus petit
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  const CustomContainer({
    super.key,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(6.0), // Réduit la taille des coins arrondis
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.0, // Réduit la taille du texte du titre
              color: Colors.black54,
            ),
          ),
          const SizedBox(
              height: 2), // Réduit l'espace entre le titre et le texte
          Text(
            text,
            style: const TextStyle(
              fontSize: 12.0, // Réduit la taille du texte principal
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
