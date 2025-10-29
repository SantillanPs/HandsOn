import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class FirestoreService {
  final CollectionReference _studentsCollection =
      FirebaseFirestore.instance.collection('students');

  // Create - Add a new student
  Future<void> addStudent(Student student) async {
    try {
      await _studentsCollection.add(student.toMap());
    } catch (e) {
      throw Exception('Failed to add student: $e');
    }
  }

  // Read - Get all students as a stream
  Stream<List<Student>> getStudents() {
    return _studentsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Read - Get a single student by ID
  Future<Student?> getStudentById(String id) async {
    try {
      DocumentSnapshot doc = await _studentsCollection.doc(id).get();
      if (doc.exists) {
        return Student.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get student: $e');
    }
  }

  // Update - Update a student's details
  Future<void> updateStudent(String id, Student student) async {
    try {
      await _studentsCollection.doc(id).update(student.toMap());
    } catch (e) {
      throw Exception('Failed to update student: $e');
    }
  }

  // Delete - Delete a student record
  Future<void> deleteStudent(String id) async {
    try {
      await _studentsCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete student: $e');
    }
  }
}
