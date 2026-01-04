import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/custom_buttom.dart';
import 'additional_info_screen.dart'; // Assurez-vous que ce chemin est correct

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  bool get _isFormValid {
    return _nameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _profileImage != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information de Base '),
        backgroundColor: Colors.red.shade800,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nom de l'école"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Votre Adresse'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(labelText: 'Numéro de téléphone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: _profileImage == null
                    ? Card(
                        child: Container(
                          height: 150,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: const Icon(Icons.camera_alt,
                              size: 100, color: Colors.white),
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        width: 320,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.file(
                            _profileImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Sélectionner une image"),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  if (_isFormValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdditionalInfoScreen(
                          name: _nameController.text,
                          address: _addressController.text,
                          email: FirebaseAuth.instance.currentUser!.email!,
                          phoneNumber: _phoneController.text,
                          profileImage: _profileImage?.path ?? '',
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Veuillez remplir tous les champs et sélectionner une image.'),
                      ),
                    );
                  }
                },
                title: "Suivant",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
