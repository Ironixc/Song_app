import 'package:flutter/material.dart';
import 'package:ukll/models/user_login.dart';
import 'package:ukll/pages/playlist.dart';
import 'package:ukll/widgets/bottom_nav.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final UserLogin user =
        ModalRoute.of(context)!.settings.arguments as UserLogin;

    final pages = [
      _buildWelcomeContent(user),
      const PlaylistPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Welcome' : 'Song Playlist'),
        backgroundColor: Colors.green,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildWelcomeContent(UserLogin user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome, ${user.firstName} ${user.lastName}",
              style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          Text("Username: ${user.username}"),
          Text("Email: ${user.email}"),
          Text("Gender: ${user.gender}"),
          const SizedBox(height: 20),
          if (user.token != null)
            Text("Token:\n${user.token!}", style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
