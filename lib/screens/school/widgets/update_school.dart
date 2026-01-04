import 'package:flutter/material.dart';
import 'package:leloprofs/models/school_model.dart';

class UpdateSchool extends StatefulWidget {
  const UpdateSchool({super.key, required this.school});
  final School school;

  @override
  State<UpdateSchool> createState() => _UpdateSchoolState();
}

class _UpdateSchoolState extends State<UpdateSchool> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? address;
  String? email;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: widget.school.name,
              decoration: const InputDecoration(labelText: 'Nom de l\'école'),
              onSaved: (value) => name = value,
            ),
            TextFormField(
              initialValue: widget.school.address,
              decoration: const InputDecoration(labelText: 'Adresse'),
              onSaved: (value) => address = value,
            ),
            TextFormField(
              initialValue: widget.school.email,
              decoration: const InputDecoration(labelText: 'Email'),
              onSaved: (value) => email = value,
            ),
            TextFormField(
              initialValue: widget.school.phoneNumber,
              decoration: const InputDecoration(labelText: 'Téléphone'),
              onSaved: (value) => phoneNumber = value,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveProfile(),
              child: const Text("Enregistrer les modifications"),
            ),
          ],
        ),
      ),
    );
  }

  // Sauvegarde des modifications
  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Mettre à jour les données de l'école
      widget.school.copyWith(
        name: name,
        address: address,
        email: email,
        phoneNumber: phoneNumber,
      );

      // Appelez votre service pour sauvegarder les données dans Firestore
      // Exemple: SchoolService.updateSchool(updatedSchool);

      Navigator.pop(context);
    }
  }
}
