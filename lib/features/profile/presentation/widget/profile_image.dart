import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final ImageProvider? imageProvider =
        imageUrl != null && imageUrl!.isNotEmpty
        ? NetworkImage(imageUrl!)
        : null;

    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey.shade300,
      backgroundImage: imageProvider,
      child: imageProvider == null
          ? Icon(Icons.person, size: 50, color: Colors.grey.shade700)
          : null,
    );
  }
}
