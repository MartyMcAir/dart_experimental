import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _supabase = Supabase.instance.client;

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<StatefulWidget> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitMessage() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus(); // removing the focus from the input field (when msg sends)
    _messageController.clear();

    //les 295 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/38556626#learning-tools
    final userId = _supabase.auth.currentSession!.user.id;
    final userData =
        await _supabase.from('users').select('user_name, img_url').eq('user_id', userId).single();

    await _supabase.from('chat').insert({
      'text': enteredMessage,
      // 'created_at': DateTime.now().toIso8601String(),
      'user_id': userId,
      'user_name': userData['user_name'],
      'user_img': userData['img_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: const InputDecoration(labelText: 'Send a message..'),
          )),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.send),
            onPressed: _submitMessage,
          )
        ],
      ),
    );
  }
}
