import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/debug_helper.dart';
import '../widgets/chat_messages.dart';
import '../widgets/new_messages.dart';
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
                try {
                  await Supabase.instance.client.auth.signOut();
                  logPrint();
                } catch (error) {
                  logPrint(additionalInfo: 'Sign out error: $error');
                }
                if (context.mounted) {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) => const AuthScreen()));
                }
              },
              icon: Icon(Icons.exit_to_app, color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        // body: const Center(child: Text('Logged in!')),
        body: const Column(
          children: [
            Expanded(child: ChatMessages()),
            NewMessages(),
          ],
        ));
  }
}
