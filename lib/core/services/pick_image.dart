import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatelessWidget {
  PickImage({super.key, required this.onImagePicked});

  final ValueChanged<File> onImagePicked;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image == null) return;
    onImagePicked(File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.edit, color: Colors.white, size: 20),
      ),
    );
  }
}
