import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/teacher_model.dart';

class TeacherController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedTeacher = Rx<Teacher?>(null);
  var selectedTeacherId = Rx<String?>(null);
  var teachers = <Teacher>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Bind the teacher stream to the teachers observable list
    _bindTeacherStream();
  }

  void _bindTeacherStream() {
    // Retrieve the teachers stream and listen to updates
    getTeachersStream().listen((data) {
      teachers.value = data;
    });
  }

  // Fonction pour vérifier si un document enseignant existe
  Future<bool> checkIfExists(String teacherId) async {
    final docSnapshot =
        await _firestore.collection('teachers').doc(teacherId).get();
    return docSnapshot.exists;
  }

  // Fonction pour obtenir un enseignant spécifique
  Future<Teacher?> getTeacher(String teacherId) async {
    final docSnapshot =
        await _firestore.collection('teachers').doc(teacherId).get();
    if (docSnapshot.exists) {
      return Teacher.fromMap(docSnapshot.data()!, docSnapshot.id);
    }
    return null;
  }

  // Fonction pour compter le nombre d'enseignants
  Future<int> countTeachers() async {
    final querySnapshot = await _firestore.collection('teachers').get();
    return querySnapshot.docs.length;
  }

  // Stream for getting the list of teachers
  Stream<List<Teacher>> getTeachersStream() {
    return _firestore.collection('teachers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Teacher.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Method to add a new teacher
  Future<void> addTeacher(Teacher teacher) async {
    final docRef = _firestore.collection('teachers').doc(teacher.id);
    await docRef.set(teacher.toMap());
  }

  // Method to update an existing teacher
  Future<void> updateTeacher(Teacher teacher) async {
    final docRef = _firestore.collection('teachers').doc(teacher.id);
    await docRef.update(teacher.toMap());
  }

  // Method to delete a teacher
  Future<void> deleteTeacher(String teacherId) async {
    final docRef = _firestore.collection('teachers').doc(teacherId);
    await docRef.delete();
  }

  // Method to select a specific teacher
  void selectTeacher(String teacherId) {
    selectedTeacherId.value = teacherId;
    selectedTeacher.value =
        teachers.firstWhere((teacher) => teacher.id == teacherId);
  }
}
