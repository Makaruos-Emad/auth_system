import 'dart:io';
import 'package:auth_system/core/services/pick_image.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.image,
    required this.onImagePicked,
  });

  final File? image;
  final ValueChanged<File> onImagePicked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: image != null ? FileImage(image!) : null,
          child: image == null ? Icon(Icons.person, size: 50) : null,
        ),

        PickImage(onImagePicked: onImagePicked),
      ],
    );
  }
}
