import 'package:flutter/material.dart';

import '../../models/school_model.dart';
import 'widgets/update_school.dart';

class SchoolProfileScreen extends StatelessWidget {
  final School school;

  const SchoolProfileScreen({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(school.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: school.profileImage != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(school.profileImage!),
                      )
                    : Icon(Icons.school),
                title: Text(school.name),
                subtitle: Text(school.address),
              ),
              SizedBox(height: 20),
              _buildDetailTile("Email", school.email ?? "Non défini"),
              _buildDetailTile("Téléphone", school.phoneNumber),
              _buildDetailTile("Département", school.department),
              _buildDetailTile(
                  "Cycle d'éducation", school.educationCycle.join(', ')),
              _buildDetailTile("Types d'école", school.types.join(', ')),
              _buildDetailTile(
                  "Statut premium", school.isPremium ? "Oui" : "Non"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showUpdateBottomSheet(context),
                child: Text("Mettre à jour le profil"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTile(String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }

  // Affichage de la boîte modale pour mettre à jour le profil
  void _showUpdateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return UpdateSchool(school: school);
      },
    );
  }
}
