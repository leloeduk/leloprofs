import 'package:cloud_firestore/cloud_firestore.dart';

class JobPost {
  String id;
  String schoolId; // ID de l'école
  String title; // Titre de l'annonce
  String description; // Description de l'annonce
  String requirements; // Exigences de l'annonce
  DateTime postDate; // Date de publication de l'annonce
  bool enable; // Indique si l'annonce est active
  bool isPay; // Indique si le poste est rémunéré
  bool isPremium; // Indique si l'annonce est premium
  DateTime? applicationDeadline; // Date limite de candidature
  String? salaryRange; // Plage salariale
  String? jobType; // Type de poste
  String? location; // Localisation du poste
  String? contactPerson; // Personne à contacter
  List<String>? benefits; // Avantages du poste

  JobPost({
    required this.id,
    required this.schoolId,
    required this.title,
    required this.description,
    required this.requirements,
    required this.postDate,
    this.enable = true,
    this.isPay = false,
    this.isPremium = false,
    this.applicationDeadline,
    this.salaryRange,
    this.jobType,
    this.location,
    this.contactPerson,
    this.benefits,
  });

  factory JobPost.fromMap(Map<String, dynamic> data, String documentId) {
    return JobPost(
      id: documentId,
      schoolId: data['schoolId'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      requirements: data['requirements'] ?? '',
      postDate: (data['postDate'] as Timestamp).toDate(),
      enable: data['enable'] ?? true,
      isPay: data['isPay'] ?? false,
      isPremium: data['isPremium'] ?? false,
      applicationDeadline:
          (data['applicationDeadline'] as Timestamp?)?.toDate(),
      salaryRange: data['salaryRange'],
      jobType: data['jobType'],
      location: data['location'],
      contactPerson: data['contactPerson'],
      benefits: List<String>.from(data['benefits'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'schoolId': schoolId,
      'title': title,
      'description': description,
      'requirements': requirements,
      'postDate': postDate,
      'enable': enable,
      'isPay': isPay,
      'isPremium': isPremium,
      'applicationDeadline': applicationDeadline != null
          ? Timestamp.fromDate(applicationDeadline!)
          : null,
      'salaryRange': salaryRange,
      'jobType': jobType,
      'location': location,
      'contactPerson': contactPerson,
      'benefits': benefits,
    };
  }

  JobPost copyWith({
    String? id,
    String? schoolId,
    String? title,
    String? description,
    String? requirements,
    DateTime? postDate,
    bool? enable,
    bool? isPay,
    bool? isPremium,
    DateTime? applicationDeadline,
    String? salaryRange,
    String? jobType,
    String? location,
    String? contactPerson,
    List<String>? benefits,
  }) {
    return JobPost(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      title: title ?? this.title,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      postDate: postDate ?? this.postDate,
      enable: enable ?? this.enable,
      isPay: isPay ?? this.isPay,
      isPremium: isPremium ?? this.isPremium,
      applicationDeadline: applicationDeadline ?? this.applicationDeadline,
      salaryRange: salaryRange ?? this.salaryRange,
      jobType: jobType ?? this.jobType,
      location: location ?? this.location,
      contactPerson: contactPerson ?? this.contactPerson,
      benefits: benefits ?? this.benefits,
    );
  }
}
