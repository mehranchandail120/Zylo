import 'package:flutter/material.dart';
import 'chat_room_screen.dart';
import '../widgets/zylo_ai_sheet.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyChats = [
      {'name': 'Zylo AI', 'msg': 'How can I help you today?', 'time': 'Now', 'isAI': true, 'unread': 0},
      {'name': 'Mehran Chandail', 'msg': 'Check out the new update! 🚀', 'time': '2m ago', 'isAI': false, 'unread': 2},
      {'name': 'Design Team', 'msg': 'Assets are ready.', 'time': '1h ago', 'isAI': false, 'unread': 0},
      {'name': 'Sarah Connor', 'msg': 'See you tomorrow.', 'time': 'Yesterday', 'isAI': false, 'unread': 0},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('zylo.pages'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings_rounded), onPressed: () {}),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.orange, Colors.pink]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white, size: 20),
              onPadding: EdgeInsets.zero,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyChats.length,
        itemBuilder: (context, index) {
          final chat = dummyChats[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: chat['isAI'] ? Colors.indigo.shade100 : Colors.grey.shade200,
                  child: chat['isAI'] 
                    ? const Icon(Icons.smart_toy_rounded, color: Colors.indigo)
                    : Text(chat['name'][0], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
                if (!chat['isAI'])
                  Positioned(
                    bottom: 0, right: 0,
                    child: Container(
                      width: 14, height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
              ],
            ),
            title: Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
            subtitle: Text(chat['msg'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(chat['time'], style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 6),
                if (chat['unread'] > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Color(0xFF0284C7), shape: BoxShape.circle),
                    child: Text('${chat['unread']}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  )
              ],
            ),
            onTap: () {
              if (chat['isAI']) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const ZyloAISheet(),
                );
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChatRoomScreen(name: chat['name'])));
              }
            },
          );
        },
      ),
    );
  }
}