import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                user?.photoURL ??
                    'https://upload.wikimedia.org/wikipedia/commons/a/aa/Sin_cara.png',
              ),
            ),
            const SizedBox(height: 10),
            Text('Name: ${user?.displayName ?? "Unknown"}'),
            Text('Email: ${user?.email ?? "Unknown"}'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                // Implement your logout logic here
                Navigator.of(context).pushReplacementNamed(AppRoute.welcome);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.leaderboard);
              },
              child: const Text('Leaderboard'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.multiplayerSearch);
              },
              child: const Text('Multiplayer'),
            ),
            ElevatedButton(
              onPressed: () async {
                final database = FirebaseDatabase.instance.reference();
                final leaderBoardRef = database.child('rooms/room1');
                await leaderBoardRef.update({'user1': 'rrrr'});
              },
              child: const Text('Update Database'),
            ),
          ],
        ),
      ),
    );
  }
}
