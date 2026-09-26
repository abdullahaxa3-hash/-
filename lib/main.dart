import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مفكرتي الذكية القوية'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                hintText: 'اكتب ملاحظتك القوية هنا...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  setState(() {
                    _notes.add(_controller.text.trim());
                    _controller.clear();
                  });
                }
              },
              child: const Text('حفظ الملاحظة', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => setState(() => _notes.removeAt(index)),
                      ),
                      title: Text(_notes[index], textAlign: TextAlign.right),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
