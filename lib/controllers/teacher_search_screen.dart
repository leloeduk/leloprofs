import 'dart:async';
import 'package:get/get.dart';
import '../models/teacher_model.dart';

class TeacherSearchController extends GetxController {
  RxList<Teacher> teachers = RxList<Teacher>();
  RxList<Teacher> filteredTeachers = RxList<Teacher>();

  // Ajout du StreamController pour les résultats de recherche
  final StreamController<List<Teacher>> _searchResultsController =
      StreamController<List<Teacher>>.broadcast();
  Stream<List<Teacher>> get searchResultsStream =>
      _searchResultsController.stream;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  void searchTeachers({
    String? department,
    String? diploma,
    String? teachingDuration,
    String? educationCycle,
    String? subject,
    String? language,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Filtrer les enseignants
      List<Teacher> results = teachers.toList();

      if (department != null && department.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.departments?.contains(department) == true;
        }).toList();
      }

      if (diploma != null && diploma.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.diploma == diploma;
        }).toList();
      }

      if (teachingDuration != null && teachingDuration.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.teachingDuration == teachingDuration;
        }).toList();
      }

      if (educationCycle != null && educationCycle.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.educationCycle.contains(educationCycle);
        }).toList();
      }

      if (subject != null && subject.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.subjects.contains(subject);
        }).toList();
      }

      if (language != null && language.isNotEmpty) {
        results = results.where((teacher) {
          return teacher.languages!.contains(language);
        }).toList();
      }

      // Émettre les résultats via le StreamController
      _searchResultsController.add(results);
    } catch (e) {
      errorMessage.value = 'Une erreur s\'est produite lors de la recherche.';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _searchResultsController.close();
    super.onClose();
  }
}
