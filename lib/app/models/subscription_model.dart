// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubscriptionModel {
  final String userType;
  final String userId;
  final String subscriptionStatus;
  final String id;
  final String subscriptionType;
  final String? createdAt;
  final String? updatedAt;
  SubscriptionModel({
    required this.userType,
    required this.userId,
    required this.subscriptionStatus,
    required this.id,
    required this.subscriptionType,
    this.createdAt,
    this.updatedAt,
  });

  SubscriptionModel copyWith({
    String? userType,
    String? userId,
    String? subscriptionStatus,
    String? id,
    String? subscriptionType,
    String? createdAt,
    String? updatedAt,
  }) {
    return SubscriptionModel(
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      id: id ?? this.id,
      subscriptionType: subscriptionType ?? this.subscriptionType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userType': userType,
      'userId': userId,
      'subscriptionStatus': subscriptionStatus,
      'id': id,
      'subscriptionType': subscriptionType,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionModel(
      userType: map['userType'] as String,
      userId: map['userId'] as String,
      subscriptionStatus: map['subscriptionStatus'] as String,
      id: map['id'] as String,
      subscriptionType: map['subscriptionType'] as String,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionModel.fromJson(String source) =>
      SubscriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubscriptionModel(userType: $userType, userId: $userId, subscriptionStatus: $subscriptionStatus, id: $id, subscriptionType: $subscriptionType, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant SubscriptionModel other) {
    if (identical(this, other)) return true;

    return other.userType == userType &&
        other.userId == userId &&
        other.subscriptionStatus == subscriptionStatus &&
        other.id == id &&
        other.subscriptionType == subscriptionType &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return userType.hashCode ^
        userId.hashCode ^
        subscriptionStatus.hashCode ^
        id.hashCode ^
        subscriptionType.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
