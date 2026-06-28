import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const GuessApp());

class GuessApp extends StatelessWidget {
  const GuessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GuessGame(),
    );
  }
}

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});
  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  late int secret;
  final ctrl = TextEditingController();
  String msg = 'خمن رقم من 1 الى 100';

  @override
  void initState() {
    super.initState();
    secret = Random().nextInt(100) + 1;
  }

  void check() {
    final n = int.tryParse(ctrl.text);
    if (n == null) return;
    setState(() {
      if (n < secret) msg = 'اكبر ⬆️';
      else if (n > secret) msg = 'اصغر ⬇️';
      else msg = 'صحيح! $secret 🎉';
    });
    ctrl.clear();
  }

  void reset() {
    setState(() {
      secret = Random().nextInt(100) + 1;
      msg = 'رقم جديد.. خمن';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صياد الارقام')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'اكتب رقمك'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: check, child: const Text('خمن'))),
                const SizedBox(width: 12),
                Expanded(child: OutlinedButton(onPressed: reset, child: const Text('جديد'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}