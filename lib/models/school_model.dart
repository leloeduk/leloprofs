// school.dart

class School {
  String id;
  String name;
  String address;
  String? email;
  String phoneNumber;
  String? profileImage;
  List<String> jobPosts;
  bool enable;
  bool isPay;
  bool isPremium;
  List<String> types; // Liste des types d'écoles
  String department; // Liste des départements
  double? ratings;
  List<String> educationCycle; // Liste des cycles d'éducation

  // Définir les listes par défaut
  static final List<String> defaultTypes = [
    'Primaire',
    'Secondaire',
    'Lycée',
    'Université',
    'Institut',
    'Autre',
  ];

  static final List<String> defaultDepartments = [
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

  static final List<String> defaultEducationCycles = [
    'Primaire',
    'Secondaire',
    'Supérieur',
    'Autre',
  ];

  School({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
    this.jobPosts = const [],
    this.enable = true,
    this.isPay = false,
    this.isPremium = false,
    required this.department,
    List<String>? types, // Paramètre optionnel
    List<String>? departments, // Paramètre optionnel
    this.ratings,
    List<String>? educationCycle, // Paramètre optionnel
  })  : types = types ?? defaultTypes,
        educationCycle = educationCycle ?? defaultEducationCycles;

  factory School.fromMap(Map<String, dynamic> data, String documentId) {
    return School(
      id: documentId,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      profileImage: data['profileImage'] ?? '',
      jobPosts: List<String>.from(data['jobPosts'] ?? []),
      enable: data['enable'] ?? true,
      isPay: data['isPay'] ?? false,
      isPremium: data['isPremium'] ?? false,
      types: List<String>.from(data['types'] ?? defaultTypes),
      department: data['departments'] ?? '',
      ratings: data['ratings']?.toDouble(),
      educationCycle:
          List<String>.from(data['educationCycle'] ?? defaultEducationCycles),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'jobPosts': jobPosts,
      'enable': enable,
      'isPay': isPay,
      'isPremium': isPremium,
      'types': types,
      'department': department,
      'ratings': ratings,
      'educationCycle': educationCycle,
    };
  }

  School copyWith({
    String? name,
    String? address,
    String? email,
    String? phoneNumber,
    String? profileImage,
    List<String>? types,
    List<String>? departments,
    double? ratings,
    List<String>? educationCycle,
  }) {
    return School(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      jobPosts: jobPosts,
      enable: enable,
      isPay: isPay,
      isPremium: isPremium,
      types: types ?? this.types,
      department: department,
      ratings: ratings ?? this.ratings,
      educationCycle: educationCycle ?? this.educationCycle,
    );
  }
}
