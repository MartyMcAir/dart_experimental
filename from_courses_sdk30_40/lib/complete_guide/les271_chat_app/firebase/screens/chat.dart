import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          IconButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (ctx) => const AuthScreen()));
              }
            },
            icon: Icon(Icons.exit_to_app, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
      body: const Center(
        child: Text('Logged in!'),
      ),
    );
  }
}
