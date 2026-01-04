import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/teacher_model.dart';
import '../../components/custom_buttom.dart';
import 'additional_info_screen.dart';
import 'widgets/custom_widget.dart';

class ProfessionalInfoScreenPart2 extends StatefulWidget {
  final String fullName;
  final String firstName;
  final XFile? profileImage;
  final String teachingDuration;
  final List<String> departments;
  final List<String> educationCycles;

  const ProfessionalInfoScreenPart2({
    super.key,
    required this.fullName,
    required this.firstName,
    required this.profileImage,
    required this.teachingDuration,
    required this.departments,
    required this.educationCycles,
  });

  @override
  State<ProfessionalInfoScreenPart2> createState() =>
      _ProfessionalInfoScreenPart2State();
}

class _ProfessionalInfoScreenPart2State
    extends State<ProfessionalInfoScreenPart2> {
  final List<String> subjects = subjectsList;
  final List<String> languages = languagesList;
  final List<String> diplomaLists = diplomaList;

  String? selectedDiploma;
  List<String> selectedSubjects = [];
  List<String> selectedLanguages = [];

  @override
  void initState() {
    super.initState();
    // Initialize the variables with default values
    selectedDiploma = null;
    selectedSubjects = [];
    selectedLanguages = [];
  }

  bool _validateForm() {
    if (selectedDiploma == null) {
      Get.snackbar('Validation Error', 'Veuillez sélectionner un diplôme.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedSubjects.isEmpty) {
      Get.snackbar(
          'Validation Error', 'Veuillez sélectionner au moins une matière.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedLanguages.isEmpty) {
      Get.snackbar(
          'Validation Error', 'Veuillez sélectionner au moins une langue.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Professionnelle - Partie 2'),
        backgroundColor: Colors.red.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdown(
                hint: 'Choisir votre diplôme',
                value: selectedDiploma,
                items: diplomaLists,
                onChanged: (value) {
                  setState(() {
                    selectedDiploma = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              buildMultiSelectChip(
                title: 'Quelles sont les matières que vous enseignez ?',
                items: subjects,
                selectedItems: selectedSubjects,
                onSelectionChanged: (selectedItems) {
                  setState(() {
                    selectedSubjects = selectedItems;
                  });
                },
              ),
              const SizedBox(height: 20),
              buildMultiSelectChip(
                title: 'Quelles langues parlez-vous ?',
                items: languages,
                selectedItems: selectedLanguages,
                onSelectionChanged: (selectedItems) {
                  setState(() {
                    selectedLanguages = selectedItems;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  if (_validateForm()) {
                    Get.to(() => AdditionalInfoScreen(
                          fullName: widget.fullName,
                          firstName: widget.firstName,
                          profileImage: widget.profileImage,
                          teachingDuration: widget.teachingDuration,
                          subjects: selectedSubjects,
                          departments: widget.departments,
                          languages: selectedLanguages,
                          educationCycles: widget.educationCycles,
                          diploma: selectedDiploma ?? "",
                        ));
                  }
                },
                title: 'Suivant',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
