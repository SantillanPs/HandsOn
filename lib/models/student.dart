class Student {
  final String? id;
  final String name;
  final String course;
  final String year;
  final String section;

  Student({
    this.id,
    required this.name,
    required this.course,
    required this.year,
    required this.section,
  });

  // Convert Student to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'year': year,
      'section': section,
    };
  }

  // Create Student from Firestore document
  factory Student.fromMap(Map<String, dynamic> map, String id) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      course: map['course'] ?? '',
      year: map['year'] ?? '',
      section: map['section'] ?? '',
    );
  }

  // Create a copy with updated fields
  Student copyWith({
    String? id,
    String? name,
    String? course,
    String? year,
    String? section,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      course: course ?? this.course,
      year: year ?? this.year,
      section: section ?? this.section,
    );
  }
}
