import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';

class JobPostController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedJobPost = Rx<JobPost?>(null);
  var jobPosts = <JobPost>[].obs;

  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Bind the job post stream to the jobPosts observable list
    jobPosts.bindStream(getJobPostsStream());
  }

  // Stream for getting the list of job posts
  Stream<List<JobPost>> getJobPostsStream() {
    return _firestore.collection('jobPosts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return JobPost.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Method to add a new job post
  Future<void> addJobPost(JobPost jobPost) async {
    try {
      final docRef = _firestore.collection('jobPosts').doc(jobPost.id);
      await docRef.set(jobPost.toMap());
    } catch (e) {
      errorMessage.value = 'Error adding job post: $e';
    }
  }

  // Method to update an existing job post
  Future<void> updateJobPost(JobPost jobPost) async {
    try {
      final docRef = _firestore.collection('jobPosts').doc(jobPost.id);
      await docRef.update(jobPost.toMap());
    } catch (e) {
      errorMessage.value = 'Error updating job post: $e';
    }
  }

  // Method to delete a job post
  Future<void> deleteJobPost(String jobPostId) async {
    try {
      final docRef = _firestore.collection('jobPosts').doc(jobPostId);
      await docRef.delete();
    } catch (e) {
      errorMessage.value = 'Error deleting job post: $e';
    }
  }

  // Method to select a specific job post
  void selectJobPost(String jobPostId) {
    selectedJobPost.value =
        jobPosts.firstWhere((jobPost) => jobPost.id == jobPostId);
  }
}
