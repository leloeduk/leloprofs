import 'package:flutter/material.dart';
import '../../../models/school_model.dart';
import '../../teacher/create/widgets/custom_widget.dart';
import 'final_school_screen.dart';

class AdditionalInfoScreen extends StatefulWidget {
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String profileImage;

  const AdditionalInfoScreen({
    super.key,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
  });

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  List<String> selectedTypes = [];
  String? selectedDepartment = "  ";
  List<String> selectedEducationCycles = [];
  double? ratings;

  bool get _isFormValid {
    return selectedTypes.isNotEmpty &&
        selectedDepartment!.isNotEmpty &&
        selectedEducationCycles.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout des informations'),
        backgroundColor: Colors.red.shade800, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMultiSelectChip(
                title: "Sélectionner le type d'école",
                items: School.defaultTypes,
                selectedItems: selectedTypes,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedTypes = selectedList;
                  });
                },
              ),
              const SizedBox(height: 26),
              buildDropdown(
                hint: 'Choisir votre département',
                value: selectedDepartment,
                items: School.defaultDepartments,
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildMultiSelectChip(
                title: 'Sélectionner votre cycle',
                items: School.defaultEducationCycles,
                selectedItems: selectedEducationCycles,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedEducationCycles = selectedList;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_isFormValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinalSchoolScreen(
                          name: widget.name,
                          address: widget.address,
                          email: widget.email,
                          phoneNumber: widget.phoneNumber,
                          profileImage: widget.profileImage,
                          types: selectedTypes,
                          department: selectedDepartment!,
                          educationCycles: selectedEducationCycles,
                          ratings: ratings,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Veuillez remplir tous les champs obligatoires.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 24.0),
                ),
                child: const Text("Créer une école "),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMultiSelectChip({
    required String title,
    required List<String> items,
    required List<String> selectedItems,
    required Function(List<String>) onSelectionChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: items.map((item) {
            final isSelected = selectedItems.contains(item);
            return ChoiceChip(
              label: Text(item),
              selected: isSelected,
              selectedColor: Colors.red.shade100, // Selected color
              backgroundColor: Colors.grey.shade300, // Unselected color
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedItems.add(item);
                  } else {
                    selectedItems.remove(item);
                  }
                  onSelectionChanged(selectedItems);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
