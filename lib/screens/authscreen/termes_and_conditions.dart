import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions Générales'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre principal
              Text(
                'Conditions Générales',
                style: TextStyle(
                  fontSize: 28, // Taille du titre
                  fontWeight: FontWeight.bold, // Poids du texte
                  color: Colors.black87, // Couleur du texte
                ),
              ),
              SizedBox(height: 24), // Espacement entre le titre et le contenu

              // Contenu
              Text(
                '1. Acceptation des Conditions\n\n'
                'En accédant et en utilisant l’application Lelo profs, vous acceptez d’être lié par ces conditions générales. Si vous n’acceptez pas ces conditions, veuillez ne pas utiliser notre application.\n\n'
                '2. Création de Compte\n\n'
                'Pour utiliser certaines fonctionnalités de Lelo profs, vous devez créer un compte. Vous pouvez créer un compte en tant qu’enseignant ou école, mais pas les deux. Vous devez fournir des informations exactes et à jour lors de la création de votre compte.\n\n'
                '3. Gestion du Compte\n\n'
                '- **Enseignants** : Vous pouvez créer, lire, mettre à jour et supprimer vos propres données d’enseignant. Les administrateurs peuvent également accéder et gérer les données des enseignants.\n\n'
                '- **Écoles** : Vous pouvez créer, lire, mettre à jour et supprimer vos propres données d’école. Vous pouvez également créer, lire, mettre à jour et supprimer des annonces dans votre sous-collection. Les administrateurs peuvent gérer toutes les données des écoles et des annonces.\n\n'
                '4. Responsabilités des Utilisateurs\n\n'
                'Vous êtes responsable de la confidentialité de vos informations de connexion et de toutes les activités qui se produisent sous votre compte. Vous devez nous informer immédiatement de toute utilisation non autorisée de votre compte.\n\n'
                '5. Gestion des Données\n\n'
                '- **Enseignants** : Vous avez la possibilité de supprimer votre compte et toutes les données associées. Les administrateurs peuvent également supprimer les comptes d’enseignants.\n\n'
                '- **Écoles** : Vous avez la possibilité de supprimer votre compte et toutes les données associées. Les administrateurs peuvent également supprimer les comptes d’écoles et les annonces associées.\n\n'
                '6. Propriété Intellectuelle\n\n'
                'Tout le contenu de l’application, y compris le texte, les graphiques, les logos, les images et les logiciels, est la propriété de Lelo profs ou de ses partenaires. Vous ne pouvez pas utiliser ce contenu sans autorisation préalable.\n\n'
                '7. Modifications des Conditions\n\n'
                'Nous nous réservons le droit de modifier ces conditions à tout moment. Les modifications seront publiées dans l’application. Votre utilisation continue de l’application après les modifications constitue votre acceptation des nouvelles conditions.\n\n'
                '8. Limitation de Responsabilité\n\n'
                'Lelo profs ne sera pas responsable des dommages indirects, accessoires, spéciaux ou consécutifs découlant de l’utilisation ou de l’incapacité d’utiliser l’application.\n\n'
                '9. Contact\n\n'
                'Pour toute question concernant ces conditions, veuillez nous contacter à : contact@leloprof.com',
                style: TextStyle(
                  fontSize: 16, // Taille de police du contenu
                  height: 1.6, // Hauteur de ligne
                  color: Colors.black54, // Couleur du texte
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
