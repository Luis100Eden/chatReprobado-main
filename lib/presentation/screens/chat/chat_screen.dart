import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/dtos/message.dart';
import '../../../presentation/providers/chats/chat_provider.dart';
import '../../../presentation/widgets/chat/message_bubble.dart';
import '../../../presentation/widgets/shared/message_field_box.dart';
import '../../../presentation/widgets/herBar/her_presentation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HerPresentation(
        nombre: 'ChatGif',
        urlAvatar:
            'https://media.tenor.com/4e9RN0U8WosAAAAC/water-cat-cat.gif',
      ),
      body: ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Container( // Wrap with a Container
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(''),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
        ),
        
      ),
      child: SafeArea(
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
                        ? HerMessageBubble(
                        message: message.text, urlGif: message.imageUrl)
                        : MyMessageBubble(message: message.text);
                  },
                ),
              ),
              MessageFieldBox(onValue: chatProvider.sendMessage),
            ],
          ),
        ),
      ),
    );
  }
}