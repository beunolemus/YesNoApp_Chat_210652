import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://imgs.search.brave.com/Y-twvT3ucNpyX219j1PLWQSIYMUp6fd9veRaOYajMTo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMjE1/NzU3NjEzNi9lcy9m/b3RvL211amVyLWpv/dmVuLWNvbi1sYS1z/b21icmEtZGUtbGFz/LWhvamFzLWRlLXBh/bG1hLWVuLWxhLXBh/cmVkLWJsYW5jYS53/ZWJwP2E9MSZiPTEm/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9ck9I/NlgzdmNSZURlSm1Z/cGdkaGg3VHl6anFP/NXBUeUVLZGhieGJC/SmZqYz0'),
          ),
        ),
        title: const Text('Mi novia♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                       
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble( message: message )
                          : MyMessageBubble( message: message );
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
