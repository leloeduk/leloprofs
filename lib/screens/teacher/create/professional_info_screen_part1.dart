import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/teacher_model.dart';
import '../../components/custom_buttom.dart';
import 'professional_info_screen_part2.dart';
import 'widgets/custom_widget.dart';

class ProfessionalInfoScreenPart1 extends StatefulWidget {
  final String fullName;
  final String firstName;
  final XFile? profileImage;

  const ProfessionalInfoScreenPart1({
    super.key,
    required this.fullName,
    required this.firstName,
    required this.profileImage,
  });

  @override
  State<ProfessionalInfoScreenPart1> createState() =>
      _ProfessionalInfoScreenPart1State();
}

class _ProfessionalInfoScreenPart1State
    extends State<ProfessionalInfoScreenPart1> {
  final List<String> teachingDuration = teachingDurationList;
  final List<String> departments = departmentsList;
  final List<String> educationCycle = educationCycleList;

  String? selectedTeachingDuration;
  String? selectedDepartment;
  List<String> selectedEducationCycle = [];

  @override
  void initState() {
    super.initState();
    // Initialize the variables with default values
    selectedTeachingDuration = null;
    selectedDepartment = null;
    selectedEducationCycle = [];
  }

  bool _validateForm() {
    if (selectedTeachingDuration == null) {
      Get.snackbar(
          'Validation Error', 'Veuillez choisir la durée d\'enseignement.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedDepartment == null) {
      Get.snackbar('Validation Error', 'Veuillez choisir un département.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (selectedEducationCycle.isEmpty) {
      Get.snackbar('Validation Error',
          'Veuillez sélectionner au moins un cycle d\'enseignement.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Professionnelle 1'),
        backgroundColor: Colors.red.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildDropdown(
                hint: 'Choisir votre durée',
                value: selectedTeachingDuration,
                items: teachingDuration,
                onChanged: (value) {
                  setState(() {
                    selectedTeachingDuration = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              buildDropdown(
                hint: 'Choisir votre département',
                value: selectedDepartment,
                items: departments,
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              buildMultiSelectChip(
                title: 'Quels sont vos cycles d\'enseignement ?',
                items: educationCycle,
                selectedItems: selectedEducationCycle,
                onSelectionChanged: (selectedItems) {
                  setState(() {
                    selectedEducationCycle = selectedItems;
                  });
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () async {
                  if (_validateForm()) {
                    Get.to(() => ProfessionalInfoScreenPart2(
                          fullName: widget.fullName,
                          firstName: widget.firstName,
                          profileImage: widget.profileImage,
                          teachingDuration: selectedTeachingDuration!,
                          departments: selectedDepartment != null
                              ? [selectedDepartment!]
                              : [],
                          educationCycles: selectedEducationCycle,
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
