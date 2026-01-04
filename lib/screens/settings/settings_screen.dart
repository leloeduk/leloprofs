import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: Colors.red.shade800, // Couleur similaire à WhatsApp
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileSection(context),
          const SizedBox(height: 20),
          _buildAccountSection(context),
          const SizedBox(height: 20),
          _buildNotificationsSection(context),
          const SizedBox(height: 20),
          _buildPrivacySection(context),
          const SizedBox(height: 20),
          _buildHelpSection(context),
          const SizedBox(height: 20),
          _buildAboutSection(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person, color: Colors.red.shade800),
      title: const Text('Mon Profil'),
      subtitle: const Text('Gérer les informations de votre profil'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileSettingsScreen()),
        );
      },
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle, color: Colors.red.shade800),
      title: const Text('Mon Compte'),
      subtitle: const Text('Gérer les paramètres du compte'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AccountSettingsScreen()),
        );
      },
    );
  }

  Widget _buildNotificationsSection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.red.shade800),
      title: const Text('Notifications'),
      subtitle: const Text('Gérer les notifications'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NotificationsSettingsScreen()),
        );
      },
    );
  }

  Widget _buildPrivacySection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.lock, color: Colors.red.shade800),
      title: const Text('Confidentialité'),
      subtitle: const Text('Gérer les paramètres de confidentialité'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PrivacySettingsScreen()),
        );
      },
    );
  }

  Widget _buildHelpSection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.help, color: Colors.red.shade800),
      title: const Text('Aide'),
      subtitle: const Text('Obtenir de l\'aide et des informations'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpScreen()),
        );
      },
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.info, color: Colors.red.shade800),
      title: const Text('À Propos'),
      subtitle: const Text('Informations sur l\'application'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutScreen()),
        );
      },
    );
  }
}

// Écrans de paramètres fictifs pour chaque section
class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Profil')),
      body: const Center(child: Text('Paramètres du profil')),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Compte')),
      body: const Center(child: Text('Paramètres du compte')),
    );
  }
}

class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Paramètres des notifications')),
    );
  }
}

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confidentialité')),
      body: const Center(child: Text('Paramètres de confidentialité')),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aide')),
      body: const Center(child: Text('Section d\'aide')),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À Propos')),
      body: const Center(child: Text('Informations sur l\'application')),
    );
  }
}
