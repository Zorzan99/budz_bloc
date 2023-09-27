// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IdPetsModel {
  final String id;
  IdPetsModel({
    required this.id,
  });

  IdPetsModel copyWith({
    String? id,
  }) {
    return IdPetsModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory IdPetsModel.fromMap(Map<String, dynamic> map) {
    return IdPetsModel(
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IdPetsModel.fromJson(String source) =>
      IdPetsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IdPetsModel(id: $id)';

  @override
  bool operator ==(covariant IdPetsModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
