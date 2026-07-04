import 'dart:io';
import 'package:auth_system/core/services/pick_image.dart';
import 'package:flutter/material.dart';

class UserImage extends StatefulWidget {
  const UserImage({super.key});

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? _image;

  void _onImagePicked(File image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Icon(Icons.person, size: 50, color: Colors.grey.shade700)
              : null,
        ),
        PickImage(onImagePicked: _onImagePicked),
      ],
    );
  }
}
