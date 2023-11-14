import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/app_theme.dart';
import 'presentation/providers/chats/chat_provider.dart';
import 'presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Chat con pregunta',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 2).theme(),
        home: const ChatScreen(),
      ),
    );
  }

  // Scaffold myHomePage() {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Material App Bar'),
  //     ),
  //     body: const Center(
  //       child: FilledButton.tonal(onPressed: null, child: Text('pícale compa')),
  //     ),
  //   );
  // }
}
