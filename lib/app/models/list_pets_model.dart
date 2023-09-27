// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:budz_bloc/app/models/id_pets_model.dart';

class ListPetsModel {
  final List<IdPetsModel> pets;
  ListPetsModel({
    required this.pets,
  });

  ListPetsModel copyWith({
    List<IdPetsModel>? pets,
  }) {
    return ListPetsModel(
      pets: pets ?? this.pets,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pets': pets.map((x) => x.toMap()).toList(),
    };
  }

  factory ListPetsModel.fromMap(Map<String, dynamic> map) {
    return ListPetsModel(
      pets: List<IdPetsModel>.from(
        (map['pets'] as List).map<IdPetsModel>(
          (x) => IdPetsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListPetsModel.fromJson(String source) =>
      ListPetsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListPetsModel(pets: $pets)';

  @override
  bool operator ==(covariant ListPetsModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.pets, pets);
  }

  @override
  int get hashCode => pets.hashCode;
}
