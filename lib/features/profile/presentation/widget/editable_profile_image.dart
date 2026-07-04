import 'dart:io';
import 'package:auth_system/core/services/pick_image.dart';
import 'package:flutter/material.dart';

class EditableProfileImage extends StatefulWidget {
  const EditableProfileImage({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  State<EditableProfileImage> createState() => _EditableProfileImageState();
}

class _EditableProfileImageState extends State<EditableProfileImage> {
  File? _selectedImage;

  void _onImagePicked(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (_selectedImage != null) {
      imageProvider = FileImage(_selectedImage!);
    } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      imageProvider = NetworkImage(widget.imageUrl!);
    }
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: imageProvider,
          child: imageProvider == null
              ? Icon(Icons.person, size: 50, color: Colors.grey.shade700)
              : null,
        ),
        PickImage(onImagePicked: _onImagePicked),
      ],
    );
  }
}
