import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get Collection of Notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // Create: Add new Note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // Read: Get Notes from Database

  // Update: Update Notes given a doc id

  // Delete: Delete Notes given a doc id
}
