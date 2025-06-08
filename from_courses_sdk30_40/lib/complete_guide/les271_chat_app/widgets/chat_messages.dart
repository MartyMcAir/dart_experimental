import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
// les297 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736704#learning-tools
    final supabase = Supabase.instance.client;
    final authenticatedUser = supabase.auth.currentUser;

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase
          .from('chat')
          .stream(primaryKey: ['id']).order('created_at', ascending: false), // true - latest msg in bottom
      builder: (context, snapshot) {
        final loadedMessages = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong.'));
        }
        if (loadedMessages == null || loadedMessages.isEmpty) {
          return const Center(child: Text('No messages found.'));
        }

        return ListView.builder(
          reverse: true, // false by default, false - up, true - down
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index) {
            final chatMessage = loadedMessages[index];
            final nextChatMessage = index + 1 < loadedMessages.length ? loadedMessages[index + 1] : null;

            final currentMessageUserId = chatMessage['user_id'];
            final nextMessageUserId = nextChatMessage != null ? nextChatMessage['user_id'] : null;
            final nextUserIsSame = nextMessageUserId == currentMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser!.id == currentMessageUserId,
              );
            } else {
              return MessageBubble.first(
                username: chatMessage['user_name'],
                isMe: authenticatedUser!.id == currentMessageUserId,
                userImage: chatMessage['user_img'],
                message: chatMessage['text'],
              );
            }
          },
        );
      },
    );
  }
}
