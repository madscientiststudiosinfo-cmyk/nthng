import 'package:flutter/material.dart';

void main() => runApp(const NthgnApp());

class NthgnApp extends StatelessWidget {
  const NthgnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nthgn',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0F0F0F),
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
        ),
      ),
      home: const ChatUI(),
    );
  }
}

class ChatUI extends StatefulWidget {
  const ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  bool _useTor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nthgn'),
        actions: [
          IconButton(
            icon: Icon(_useTor ? Icons.lock : Icons.lock_open),
            onPressed: () => setState(() => _useTor = !_useTor),
            tooltip: 'Toggle Tor Routing',
          ),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMsgBubble('Welcome to Nthgn - secure messenger.', false),
                _buildMsgBubble('Routing via Tor: ${_useTor ? 'Enabled' : 'Disabled'}', true),
              ],
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildMsgBubble(String msg, bool isSelf) {
    return Align(
      alignment: isSelf ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isSelf ? const Color(0xFF2E7D32) : const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(msg, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        border: Border(top: BorderSide(color: Color(0xFF333333))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Message...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
