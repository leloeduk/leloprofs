import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/teacher_search_screen.dart';
import '../../models/teacher_model.dart';
import 'advanced_search_screen.dart';

class TeacherSearchScreen extends StatelessWidget {
  final TeacherSearchController searchController =
      Get.put(TeacherSearchController());
  final TextEditingController searchControllerText = TextEditingController();

  TeacherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Recherche Enseignants'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Champ de texte pour la recherche
            TextField(
              controller: searchControllerText,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Nom, matière ou diplôme',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _searchTeachers();
              },
            ),
            const SizedBox(height: 16),
            // Bouton pour la recherche avancée
            ElevatedButton(
              onPressed: () {
                _showAdvancedSearchModal(context);
              },
              child: const Text('Recherche Avancée'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (searchController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (searchController.errorMessage.isNotEmpty) {
                  return Center(
                      child: Text(searchController.errorMessage.value));
                } else {
                  return StreamBuilder<List<Teacher>>(
                    stream: searchController.searchResultsStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Une erreur s\'est produite.'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('Aucun enseignant trouvé.'));
                      } else {
                        final teachers = snapshot.data!;
                        return ListView.builder(
                          itemCount: teachers.length,
                          itemBuilder: (context, index) {
                            final teacher = teachers[index];
                            return ListTile(
                              title: Text(teacher.fullName),
                              subtitle: Text(
                                  'Matière: ${teacher.subjects.join(', ')}'),
                            );
                          },
                        );
                      }
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _searchTeachers() {
    searchController.searchTeachers(
      department: null, // Ajoutez d'autres paramètres si nécessaire
      diploma: null,
      teachingDuration: null,
      educationCycle: null,
      subject: null,
      language: null,
    );
  }

  void _showAdvancedSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const AdvancedSearchScreen();
      },
    );
  }
}
