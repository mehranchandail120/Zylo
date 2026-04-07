import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Stories', style: TextStyle(color: Colors.black87)),
        actions: [
          IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {})
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('My Story', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              children: [
                Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.blue, width: 2)),
                  child: const Center(child: Icon(Icons.person, color: Colors.grey)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Your Story', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                      Text('Tap to add an update', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.add, color: Colors.blue), onPressed: () {})
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Recent Stories', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text('No public stories yet.', style: TextStyle(color: Colors.grey.shade400, fontStyle: FontStyle.italic)),
            ),
          )
        ],
      ),
    );
  }
}