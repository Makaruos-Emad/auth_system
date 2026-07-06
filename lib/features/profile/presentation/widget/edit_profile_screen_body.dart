import 'dart:io';
import 'package:auth_system/core/services/storage_service.dart';
import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/profile/data/model/profile_model.dart';
import 'package:auth_system/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:auth_system/features/profile/presentation/widget/editable_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({super.key, required this.profile});

  final ProfileModel profile;

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  late final TextEditingController nameController;
  String? _selectedImageUrl;
  File? _selectedImageFile;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.profile.name);
    _selectedImageUrl = widget.profile.imageUrl;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, dynamic>(
      builder: (context, state) {
        final profile = state.profile ?? widget.profile;

        return Column(
          children: [
            EditableProfileImage(
              imageUrl: _selectedImageUrl,
              selectedImage: _selectedImageFile,
              onImageChanged: (image) {
                setState(() {
                  _selectedImageFile = image;
                  _selectedImageUrl = null;
                });
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "Full Name",
              controller: nameController,
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: _isSubmitting ? 'Loading...' : 'Submit Changes',
              isLoading: _isSubmitting,
              onPressed: _isSubmitting
                  ? null
                  : () async {
                      setState(() => _isSubmitting = true);

                      try {
                        final currentProfile = profile ?? widget.profile;
                        String? uploadedImageUrl = _selectedImageUrl;

                        if (_selectedImageFile != null) {
                          uploadedImageUrl =
                              await StorageService.uploadProfileImage(
                                userId: currentProfile.id,
                                image: _selectedImageFile!,
                              );
                        }

                        await context.read<ProfileCubit>().updateProfile(
                          name: nameController.text.trim(),
                          imageUrl: uploadedImageUrl ?? currentProfile.imageUrl,
                        );

                        if (!mounted) return;
                        Navigator.of(context).pop();
                      } finally {
                        if (mounted) {
                          setState(() => _isSubmitting = false);
                        }
                      }
                    },
            ),
          ],
        );
      },
    );
  }
}
