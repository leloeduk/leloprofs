class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<OnboardingModel> onboardings = [
  OnboardingModel(
    title: "Bienvenue dans Lelo Profs ",
    description:
        "Votre plateforme pour trouver des professeurs adaptés à vos besoins.",
    imagePath: "assets/images/onboarding01.jpg",
  ),
  OnboardingModel(
    title: "Découvrez nos Fonctionnalités",
    description:
        "Recherche avancée de professeurs\nÉvaluations et avis des étudiants\nMessagerie intégrée pour communiquer",
    imagePath: "assets/images/onboarding02.jpg",
  ),
  OnboardingModel(
    title: "Rejoignez-nous !",
    description: "Créez votre compte pour commencer à explorer.",
    imagePath: "assets/images/onboarding03.jpg",
  ),
];
