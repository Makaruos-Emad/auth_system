import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/profile/presentation/widget/editable_profile_image.dart';
import 'package:flutter/material.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({super.key});

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: "Makarious Emad");
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EditableProfileImage(imageUrl: null),
        const SizedBox(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: Text("Name", style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(hintText: "Full Name", controller: nameController),
        const SizedBox(height: 50),
        CustomButton(text: "Submit Changes", onPressed: () {}),
      ],
    );
  }
}
