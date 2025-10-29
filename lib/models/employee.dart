class Employee {
  final String? id;
  final String name;
  final String position;
  final String status;
  final String agency;

  Employee({
    this.id,
    required this.name,
    required this.position,
    required this.status,
    required this.agency,
  });

  // Convert Employee to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': position,
      'status': status,
      'agency': agency,
    };
  }

  // Create Employee from Firestore document
  factory Employee.fromMap(Map<String, dynamic> map, String id) {
    return Employee(
      id: id,
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      status: map['status'] ?? '',
      agency: map['agency'] ?? '',
    );
  }

  // Create a copy with updated fields
  Employee copyWith({
    String? id,
    String? name,
    String? position,
    String? status,
    String? agency,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      status: status ?? this.status,
      agency: agency ?? this.agency,
    );
  }
}
