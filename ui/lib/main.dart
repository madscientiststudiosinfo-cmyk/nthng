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
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2E7D32),
          secondary: Color(0xFF2E7D32),
          surface: Color(0xFF0F0F0F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
          centerTitle: true,
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
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nthgn', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(_useTor ? Icons.lock : Icons.lock_open, color: _useTor ? Colors.green : Colors.red),
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
                _buildMsgBubble('Welcome to Nthgn - Private. Secure. Anonymous.', false),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelf ? const Color(0xFF2E7D32) : const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF121212),
        border: Border(top: BorderSide(color: Color(0xFF333333))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your message...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 14),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send_rounded, color: Color(0xFF2E7D32)),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
