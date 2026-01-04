class Teacher {
  String id;
  String fullName;
  String firstName;
  String teachingDuration;
  List<String> subjects;
  List<String> universitySubjects;
  List<String> educationCycle;
  int yearsOfExperience;
  String diploma;
  String? profileImage;
  String phoneNumber;
  bool isAdmin;
  bool enable;
  bool isPay;
  bool isPremium;
  String? availability; // Nouvelle propriété
  String? bio; // Nouvelle propriété
  List<String>? reviews; // Nouvelle propriété
  List<String>? certifications; // Nouvelle propriété
  String? location; // Nouvelle propriété
  List<String>? languages; // Nouvelle propriété
  List<String>? departments; // Correction du nom de la propriété

  Teacher({
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.teachingDuration,
    required this.subjects,
    required this.universitySubjects,
    required this.educationCycle,
    required this.yearsOfExperience,
    required this.diploma,
    this.profileImage,
    this.phoneNumber = '',
    this.isAdmin = false,
    this.enable = true,
    this.isPay = false,
    this.isPremium = false,
    this.availability,
    this.bio,
    this.reviews,
    this.certifications,
    this.location,
    this.languages,
    this.departments, // Correction du nom de la propriété
  });

  factory Teacher.fromMap(Map<String, dynamic> data, String documentId) {
    return Teacher(
      id: documentId,
      fullName: data['fullName'] ?? '',
      firstName: data['firstName'] ?? '',
      teachingDuration: data['teachingDuration'] ?? '',
      subjects: List<String>.from(data['subjects'] ?? []),
      universitySubjects: List<String>.from(data['universitySubjects'] ?? []),
      educationCycle: List<String>.from(data['educationCycle'] ?? []),
      yearsOfExperience: data['yearsOfExperience'] ?? 0,
      diploma: data['diploma'] ?? '',
      profileImage: data['profileImage'],
      phoneNumber: data['phoneNumber'] ?? '',
      isAdmin: data['isAdmin'] ?? false,
      enable: data['enable'] ?? true,
      isPay: data['isPay'] ?? false,
      isPremium: data['isPremium'] ?? false,
      availability: data['availability'],
      bio: data['bio'],
      reviews: List<String>.from(data['reviews'] ?? []),
      certifications: List<String>.from(data['certifications'] ?? []),
      location: data['location'],
      languages: List<String>.from(data['languages'] ?? []),
      departments: List<String>.from(
          data['departments'] ?? []), // Correction du nom de la propriété
    );
  }

  get levelOfStudy => null;

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'firstName': firstName,
      'teachingDuration': teachingDuration,
      'subjects': subjects,
      'universitySubjects': universitySubjects,
      'educationCycle': educationCycle,
      'yearsOfExperience': yearsOfExperience,
      'diploma': diploma,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'enable': enable,
      'isPay': isPay,
      'isPremium': isPremium,
      'availability': availability,
      'bio': bio,
      'reviews': reviews,
      'certifications': certifications,
      'location': location,
      'languages': languages,
      'departments': departments, // Correction du nom de la propriété
    };
  }

  Teacher copyWith({
    String? fullName,
    String? firstName,
    String? teachingDuration,
    List<String>? subjects,
    List<String>? universitySubjects,
    List<String>? educationCycle,
    int? yearsOfExperience,
    String? diploma,
    String? profileImage,
    String? phoneNumber,
    bool? isAdmin,
    bool? enable,
    bool? isPay,
    bool? isPremium,
    String? availability,
    String? bio,
    List<String>? reviews,
    List<String>? certifications,
    String? location,
    List<String>? languages,
    List<String>? departments, // Correction du nom de la propriété
  }) {
    return Teacher(
      id: id,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      teachingDuration: teachingDuration ?? this.teachingDuration,
      subjects: subjects ?? this.subjects,
      universitySubjects: universitySubjects ?? this.universitySubjects,
      educationCycle: educationCycle ?? this.educationCycle,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      diploma: diploma ?? this.diploma,
      profileImage: profileImage ?? this.profileImage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAdmin: isAdmin ?? this.isAdmin,
      enable: enable ?? this.enable,
      isPay: isPay ?? this.isPay,
      isPremium: isPremium ?? this.isPremium,
      availability: availability ?? this.availability,
      bio: bio ?? this.bio,
      reviews: reviews ?? this.reviews,
      certifications: certifications ?? this.certifications,
      location: location ?? this.location,
      languages: languages ?? this.languages,
      departments:
          departments ?? this.departments, // Correction du nom de la propriété
    );
  }
}

final List<String> educationCycleList = [
  '',
  'Matérnelle',
  'Primaire',
  'Collège',
  'Lycée',
  'Université'
];
final List<String> diplomaList = [
  '',
  'BEPC',
  'BAC',
  'BTS',
  'Licence',
  'Master',
  'Doctorat',
  'Autre',
];

final List<String> departmentsList = [
  '',
  'Kouilou',
  'Niari',
  'Lékoumou',
  'Sangha',
  'Cuvette',
  'Cuvette-Ouest',
  'Plateaux',
  'Pool',
  'Brazzaville',
  'Pointe-Noire',
];

final List<String> subjectsList = [
  '',
  'Mathématiques',
  'Physique-Chimie',
  'Biologie(SVT)',
  'Français',
  'Anglais',
  'Histoire',
  'Géographie',
  'Dessin',
  'Informatique',
  'Autres'
  // Ajoutez d'autres matières spécifiques si nécessaire
];

final List<String> teachingDurationList = [
  '',
  "1 ans ",
  "2 ans ",
  "3 ans ",
  "4 ans ",
  "5 ans et plus",
];

final List<String> languagesList = [
  '  ',
  'Anglais',
  'Français',
  'Espagnol',
  'Allemand',
  'Italien',
  'Chinois',
  'Arabe',
  'Russe',
  'Japonais',
  'Autre',
];
