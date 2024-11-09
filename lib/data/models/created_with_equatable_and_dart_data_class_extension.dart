import 'dart:convert';
import 'package:equatable/equatable.dart';

/*
Here I used "Dart Data Class Extension" and Equatable
TO GENERATE data class
 */

class Person extends Equatable {
  final int id;
  final String name;
  final String? email;

  const Person({required this.id, required this.name, required this.email});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, email];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('id') ||
        !map.containsKey('email') | !map.containsKey('name')) {
      throw ArgumentError('Invalid map data');
    }

    return Person(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? "No name",
      email: (map['email']) ?? "Empty name",
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  Person copyWith({
    required int id,
    required String name,
    String? email,
  }) {
    return Person(
      id: id,
      name: name,
      email: email ?? this.email,
    );
  }
}
