// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String email;
  final String generalPetID;
  final String? thirdPartyLoginIdToken;
  final String? pushAllow;
  final String? thirdPartyLoginServerAuthCode;
  final String? photoUrl;
  final String? isThirdPartyLogin;
  final String? phoneNumber;
  final String? birthdate;
  final String? gender;
  final String fullname;
  final String updatedDate;
  final String createdDate;
  final String id;
  final String nickname;
  final String password;
  UserModel({
    required this.email,
    required this.generalPetID,
    this.thirdPartyLoginIdToken,
    this.pushAllow,
    this.thirdPartyLoginServerAuthCode,
    this.photoUrl,
    this.isThirdPartyLogin,
    this.phoneNumber,
    this.birthdate,
    this.gender,
    required this.fullname,
    required this.updatedDate,
    required this.createdDate,
    required this.id,
    required this.nickname,
    required this.password,
  });

  UserModel copyWith({
    String? email,
    String? generalPetID,
    String? thirdPartyLoginIdToken,
    String? pushAllow,
    String? thirdPartyLoginServerAuthCode,
    String? photoUrl,
    String? isThirdPartyLogin,
    String? phoneNumber,
    String? birthdate,
    String? gender,
    String? fullname,
    String? updatedDate,
    String? createdDate,
    String? id,
    String? nickname,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      generalPetID: generalPetID ?? this.generalPetID,
      thirdPartyLoginIdToken:
          thirdPartyLoginIdToken ?? this.thirdPartyLoginIdToken,
      pushAllow: pushAllow ?? this.pushAllow,
      thirdPartyLoginServerAuthCode:
          thirdPartyLoginServerAuthCode ?? this.thirdPartyLoginServerAuthCode,
      photoUrl: photoUrl ?? this.photoUrl,
      isThirdPartyLogin: isThirdPartyLogin ?? this.isThirdPartyLogin,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      fullname: fullname ?? this.fullname,
      updatedDate: updatedDate ?? this.updatedDate,
      createdDate: createdDate ?? this.createdDate,
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'generalPetID': generalPetID,
      'thirdPartyLoginIdToken': thirdPartyLoginIdToken,
      'pushAllow': pushAllow,
      'thirdPartyLoginServerAuthCode': thirdPartyLoginServerAuthCode,
      'photoUrl': photoUrl,
      'isThirdPartyLogin': isThirdPartyLogin,
      'phoneNumber': phoneNumber,
      'birthdate': birthdate,
      'gender': gender,
      'fullname': fullname,
      'updatedDate': updatedDate,
      'createdDate': createdDate,
      'id': id,
      'nickname': nickname,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      generalPetID: map['generalPetID'] as String,
      thirdPartyLoginIdToken: map['thirdPartyLoginIdToken'] != null
          ? map['thirdPartyLoginIdToken'] as String
          : null,
      pushAllow: map['pushAllow'] != null ? map['pushAllow'] as String : null,
      thirdPartyLoginServerAuthCode:
          map['thirdPartyLoginServerAuthCode'] != null
              ? map['thirdPartyLoginServerAuthCode'] as String
              : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      isThirdPartyLogin: map['isThirdPartyLogin'] != null
          ? map['isThirdPartyLogin'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      birthdate: map['birthdate'] != null ? map['birthdate'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      fullname: map['fullname'] as String,
      updatedDate: map['updatedDate'] as String,
      createdDate: map['createdDate'] as String,
      id: map['id'] as String,
      nickname: map['nickname'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, generalPetID: $generalPetID, thirdPartyLoginIdToken: $thirdPartyLoginIdToken, pushAllow: $pushAllow, thirdPartyLoginServerAuthCode: $thirdPartyLoginServerAuthCode, photoUrl: $photoUrl, isThirdPartyLogin: $isThirdPartyLogin, phoneNumber: $phoneNumber, birthdate: $birthdate, gender: $gender, fullname: $fullname, updatedDate: $updatedDate, createdDate: $createdDate, id: $id, nickname: $nickname, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.generalPetID == generalPetID &&
        other.thirdPartyLoginIdToken == thirdPartyLoginIdToken &&
        other.pushAllow == pushAllow &&
        other.thirdPartyLoginServerAuthCode == thirdPartyLoginServerAuthCode &&
        other.photoUrl == photoUrl &&
        other.isThirdPartyLogin == isThirdPartyLogin &&
        other.phoneNumber == phoneNumber &&
        other.birthdate == birthdate &&
        other.gender == gender &&
        other.fullname == fullname &&
        other.updatedDate == updatedDate &&
        other.createdDate == createdDate &&
        other.id == id &&
        other.nickname == nickname &&
        other.password == password;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        generalPetID.hashCode ^
        thirdPartyLoginIdToken.hashCode ^
        pushAllow.hashCode ^
        thirdPartyLoginServerAuthCode.hashCode ^
        photoUrl.hashCode ^
        isThirdPartyLogin.hashCode ^
        phoneNumber.hashCode ^
        birthdate.hashCode ^
        gender.hashCode ^
        fullname.hashCode ^
        updatedDate.hashCode ^
        createdDate.hashCode ^
        id.hashCode ^
        nickname.hashCode ^
        password.hashCode;
  }
}
