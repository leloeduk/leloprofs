import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/school_model.dart';

class SchoolController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedSchool = Rx<School?>(null);
  var selectedSchoolId = Rx<String?>(null);
  var isLoading = false.obs;
  var schools = <School>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Bind the school stream to the schools observable list
    schools.bindStream(getSchoolsStream());
  }

  Future<bool> checkIfExists(String schoolId) async {
    final docSnapshot =
        await _firestore.collection('schools').doc(schoolId).get();
    return docSnapshot.exists;
  }

  Future<School?> getSchool(String schoolId) async {
    final docSnapshot =
        await _firestore.collection('schools').doc(schoolId).get();
    if (docSnapshot.exists) {
      return School.fromMap(docSnapshot.data()!, docSnapshot.id);
    }
    return null;
  }

  Future<int> countSchools() async {
    final querySnapshot = await _firestore.collection('schools').get();
    return querySnapshot.docs.length;
  }

  // Stream for getting the list of schools
  Stream<List<School>> getSchoolsStream() {
    return _firestore.collection('schools').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return School.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Method to add a new school
  Future<void> addSchool(School school) async {
    try {
      final docRef = _firestore.collection('schools').doc(school.id);
      await docRef.set(school.toMap());
    } catch (e) {
      errorMessage.value = 'Erreur lors de l\'ajout de l\'école: $e';
    }
  }

  // Method to update an existing school
  Future<void> updateSchool(School school) async {
    try {
      final docRef = _firestore.collection('schools').doc(school.id);
      await docRef.update(school.toMap());
    } catch (e) {
      errorMessage.value = 'Erreur lors de la mise à jour de l\'école: $e';
    }
  }

  // Method to delete a school
  Future<void> deleteSchool(String schoolId) async {
    try {
      final docRef = _firestore.collection('schools').doc(schoolId);
      await docRef.delete();
    } catch (e) {
      errorMessage.value = 'Erreur lors de la suppression de l\'école: $e';
    }
  }

  // Method to select a specific school
  void selectSchool(String schoolId) {
    selectedSchoolId.value = schoolId;
    selectedSchool.value =
        schools.firstWhere((school) => school.id == schoolId);
  }
}
