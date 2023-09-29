import 'dart:typed_data';

class ProfileImage {
  final int id;
  final Uint8List imageBytes;

  ProfileImage({required this.id, required this.imageBytes});
}
