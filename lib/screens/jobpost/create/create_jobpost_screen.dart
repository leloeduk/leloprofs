import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/school_controller.dart';
import '../../../models/post_model.dart';
import 'final_jobpost_screen.dart';

class CreateJobPostScreen extends StatefulWidget {
  const CreateJobPostScreen({super.key});

  @override
  State<CreateJobPostScreen> createState() => _CreateJobPostScreenState();
}

class _CreateJobPostScreenState extends State<CreateJobPostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _salaryRangeController = TextEditingController();
  final TextEditingController _jobTypeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _benefitsController = TextEditingController();
  DateTime? _applicationDeadline;
  final SchoolController _schoolController = Get.find();

  bool _validateForm() {
    if (_schoolController.selectedSchoolId.value == null) {
      Get.snackbar('Validation Error', 'Veuillez sélectionner une école.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (_titleController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Veuillez entrer un titre.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _applicationDeadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _applicationDeadline) {
      setState(() {
        _applicationDeadline = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying school list for selection
              Obx(() {
                if (_schoolController.schools.isEmpty) {
                  return const CircularProgressIndicator();
                }
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select School',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  value: _schoolController.selectedSchoolId.value,
                  onChanged: (value) {
                    _schoolController.selectedSchoolId.value = value;
                  },
                  items: _schoolController.schools.map((school) {
                    return DropdownMenuItem<String>(
                      value: school.id,
                      child: Text(school.name),
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _requirementsController,
                decoration: const InputDecoration(
                  labelText: 'Requirements',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _salaryRangeController,
                decoration: const InputDecoration(
                  labelText: 'Salary Range',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _jobTypeController,
                decoration: const InputDecoration(
                  labelText: 'Job Type',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactPersonController,
                decoration: const InputDecoration(
                  labelText: 'Contact Person',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _benefitsController,
                decoration: const InputDecoration(
                  labelText: 'Benefits (comma separated)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Application Deadline: ${_applicationDeadline != null ? "${_applicationDeadline!.toLocal()}".split(' ')[0] : 'Not selected'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: const Text('Select Date'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateForm()) {
                    final jobPost = JobPost(
                      id: '', // Generate or use a method to get a unique ID
                      schoolId: _schoolController.selectedSchoolId.value!,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      requirements: _requirementsController.text,
                      postDate: DateTime.now(),
                      enable: true,
                      isPay: false,
                      isPremium: false,
                      applicationDeadline: _applicationDeadline,
                      salaryRange: _salaryRangeController.text,
                      jobType: _jobTypeController.text,
                      location: _locationController.text,
                      contactPerson: _contactPersonController.text,
                      benefits: _benefitsController.text
                          .split(',')
                          .map((s) => s.trim())
                          .toList(),
                    );

                    Get.to(() => FinalJobPostScreen(jobPost: jobPost));
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
