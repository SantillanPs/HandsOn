import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/employee.dart';

class FirestoreService {
  final CollectionReference _employeesCollection =
      FirebaseFirestore.instance.collection('employees');

  // Create - Add a new employee
  Future<void> addEmployee(Employee employee) async {
    try {
      await _employeesCollection.add(employee.toMap());
    } catch (e) {
      throw Exception('Failed to add employee: $e');
    }
  }

  // Read - Get all employees as a stream
  Stream<List<Employee>> getEmployees() {
    return _employeesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Employee.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Read - Get a single employee by ID
  Future<Employee?> getEmployeeById(String id) async {
    try {
      DocumentSnapshot doc = await _employeesCollection.doc(id).get();
      if (doc.exists) {
        return Employee.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get employee: $e');
    }
  }

  // Update - Update an employee's details
  Future<void> updateEmployee(String id, Employee employee) async {
    try {
      await _employeesCollection.doc(id).update(employee.toMap());
    } catch (e) {
      throw Exception('Failed to update employee: $e');
    }
  }

  // Delete - Delete an employee record
  Future<void> deleteEmployee(String id) async {
    try {
      await _employeesCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete employee: $e');
    }
  }
}
