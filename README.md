📚 Lelo Profs – Application de gestion des écoles et enseignants
🧠 Description

Lelo Profs est une application mobile développée avec Flutter et Firebase qui permet la gestion des écoles et des enseignants.
Elle facilite la création de profils d’écoles, la publication d’annonces, la consultation des profils et la mise en relation entre écoles et enseignants.

L’application est conçue pour être simple, moderne et évolutive, avec une séparation claire des rôles (école / enseignant / administrateur).

🚀 Fonctionnalités principales
🏫 Écoles

Création d’un compte école

Ajout des informations de base :

Nom

Ville

Téléphone

Image de profil

Informations avancées :

Types d’école (primaire, secondaire, université…)

Département

Cycles d’éducation

Année de création

Biographie

Mise à jour du profil école

Affichage du profil public de l’école

👨‍🏫 Enseignants

Création et gestion de profil enseignant

Consultation des écoles

Accès aux annonces publiées par les écoles

🔐 Authentification

Authentification avec Firebase Authentication

Connexion par email et mot de passe

Gestion sécurisée des utilisateurs

☁️ Données & stockage

Cloud Firestore pour la gestion des données

Firebase Storage pour les images (profil école)

Architecture MVC avec GetX

🖥️ Technologies utilisées

Flutter (Dart)

Firebase Authentication

Cloud Firestore

Firebase Storage

GetX (state management & navigation)

CachedNetworkImage

Image Picker

🎨 UI / UX

Design moderne inspiré de WhatsApp

Couleur principale : 🔴 Rouge

Formulaires clairs avec validation

Navigation fluide entre les écrans

Pages connectées logiquement :

BasicInfoScreen

AdditionalInfoScreen

InfoSchoolScreen

FinalSchoolScreen

🔧 Installation

Cloner le projet :

git clone https://github.com/ton-compte/lelo-profs.git


Installer les dépendances :

flutter pub get


Configurer Firebase :

Ajouter google-services.json

Activer Authentication, Firestore et Storage

Lancer l’application :

flutter run

📈 Évolutions prévues

Système de notation avancé

Chat école ↔ enseignant

Notifications push

Abonnement Premium pour écoles

Tableau de bord administrateur

👨‍💻 Auteur

Lelo
Développeur Flutter & Formateur
📍 Afrique / International