import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Back to previous page
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/appimg2.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sabrina Aryan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'SabrinaAry208@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            const Divider(),
            const ProfileOption(icon: Icons.favorite, title: 'Favourites'),
            const ProfileOption(icon: Icons.download, title: 'Downloads'),
            const Divider(),
            const ProfileOption(icon: Icons.language, title: 'Languages'),
            const ProfileOption(icon: Icons.location_on, title: 'Location'),
            const ProfileOption(icon: Icons.subscriptions, title: 'Subscription'),
            const ProfileOption(icon: Icons.display_settings, title: 'Display'),
            const Divider(),
            const ProfileOption(icon: Icons.delete, title: 'Clear Cache'),
            const ProfileOption(icon: Icons.history, title: 'Clear History'),
            const ProfileOption(icon: Icons.logout, title: 'Log Out'),
            const SizedBox(height: 20),
            const Text(
              'App Version 2.3',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Helper widget for each profile option
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileOption({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: () {},
    );
  }
}
