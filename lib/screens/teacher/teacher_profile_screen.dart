import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/teacher_controller.dart';
import '../../models/teacher_model.dart';

class TeacherProfileScreen extends StatelessWidget {
  final TeacherController teacherController;

  TeacherProfileScreen(
      {super.key, TeacherController? controller, required Teacher teacher})
      : teacherController = controller ?? Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Enseignant'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (teacherController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final errorMessage = teacherController.errorMessage.value;
        if (errorMessage.isNotEmpty) {
          return Center(child: Text(errorMessage));
        }

        final teacher = teacherController.selectedTeacher.value;

        if (teacher == null) {
          return const Center(child: Text('Aucun enseignant sélectionné.'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: teacher.profileImage ?? '',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 60,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${teacher.fullName} ${teacher.firstName}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      teacher.diploma,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _showContactModal(context, teacher);
                          },
                          icon: const Icon(Icons.email),
                          label: const Text('Contacter'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            _callTeacher(teacher.phoneNumber);
                          },
                          icon: const Icon(Icons.phone),
                          label: const Text('Appeler'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Détails Professionnels'),
                    _buildDetailRow(
                      Icons.school,
                      'Durée d\'enseignement : ${teacher.teachingDuration}',
                      () => _showUpdateModal(context, 'Durée d\'enseignement',
                          teacher.teachingDuration, (newValue) {
                        teacherController.updateTeacher(
                            teacher.copyWith(teachingDuration: newValue));
                      }),
                    ),
                    _buildDetailRow(
                      Icons.calendar_today,
                      'Années d\'expérience : ${teacher.yearsOfExperience}',
                      () => _showUpdateModal(context, 'Années d\'expérience',
                          teacher.yearsOfExperience.toString(), (newValue) {
                        teacherController.updateTeacher(teacher.copyWith(
                            yearsOfExperience: int.parse(newValue)));
                      }),
                    ),
                    _buildDetailRow(
                      Icons.location_on,
                      'Location : ${teacher.location}',
                      () => _showUpdateModal(
                          context, 'Location', teacher.location ?? '',
                          (newValue) {
                        teacherController.updateTeacher(
                            teacher.copyWith(location: newValue));
                      }),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Biographie'),
                    Text(
                      teacher.bio ?? 'Aucune biographie disponible.',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Certifications'),
                    Text(
                      teacher.certifications?.join(', ') ??
                          'Aucune certification disponible.',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Langues'),
                    Text(
                      teacher.languages?.join(', ') ??
                          'Aucune langue indiquée.',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Avis'),
                    Text(
                      teacher.reviews?.join(', ') ?? 'Aucun avis disponible.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _showContactModal(BuildContext context, Teacher teacher) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Contacter ${teacher.fullName}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // _contactTeacher(teacher.email ?? '');
                },
                icon: const Icon(Icons.email),
                label: const Text('Envoyer un Email'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _callTeacher(teacher.phoneNumber);
                },
                icon: const Icon(Icons.phone),
                label: const Text('Appeler'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUpdateModal(BuildContext context, String title, String initialValue,
      Function(String) onSave) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Modifier $title',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: title,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  onSave(controller.text);
                  Navigator.pop(context);
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _contactTeacher(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Contact Teacher',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void _callTeacher(String phoneNumber) async {
    final Uri callLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(callLaunchUri)) {
      await launchUrl(callLaunchUri);
    } else {
      throw 'Could not launch $callLaunchUri';
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String detail, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                detail,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (onTap != null) Icon(Icons.edit, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
