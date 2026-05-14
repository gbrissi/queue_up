import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  File? imgFile;

  Widget get img => Image.file(imgFile!, fit: BoxFit.cover);
  Widget get placeholder => Icon(Icons.person, size: 48);

  Future<void> _pickImg() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        imgFile = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: SizedBox(
          width: 96,
          height: 96,
          child: InkWell(
            onTap: _pickImg,
            child: imgFile != null ? img : placeholder,
          ),
        ),
      ),
    );
  }
}
