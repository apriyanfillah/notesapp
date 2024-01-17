import 'package:flutter/material.dart';
import 'package:notesapp/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Firestore
  final FirestoreService firestoreService = FirestoreService();

  // Text Controller
  final TextEditingController textController = TextEditingController();

  // Open a dialog vox to add a Note
  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // Button to Save
          ElevatedButton(
            onPressed: () {
              // Add a new Note
              firestoreService.addNote(textController.text);

              // Clear the next controller
              textController.clear();

              // Close the box
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
