import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class QuillPage extends StatefulWidget {
  const QuillPage({super.key});

  @override
  State<QuillPage> createState() => _QuillPageState();
}

class _QuillPageState extends State<QuillPage> {
  final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              child: QuillToolbar.basic(
                controller: _controller,
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: _controller,
                readOnly: false, // true for view only mode
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint(_controller.document.toPlainText());
                  var json =
                      jsonEncode(_controller.document.toDelta().toJson());
                  debugPrint(json);
                },
                child: Text("print text"))
          ],
        ),
      ),
    );
  }
}
