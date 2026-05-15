import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/user_profile/components/user_avatar/components/image_cropper.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogOverlay(
      options: [
        DialogOption(name: 'avatar', content: ImageCropperDlg(file: null)),
      ],
      child: const _UserAvatarImpl(),
    );
  }
}

class _UserAvatarImpl extends StatefulWidget {
  const _UserAvatarImpl();

  @override
  State<_UserAvatarImpl> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<_UserAvatarImpl> {
  File? imgFile;

  Widget get img => Image.file(imgFile!, fit: BoxFit.cover);
  Widget get placeholder => Icon(Icons.person, size: 48);

  Future<void> _pickImg(BuildContext ctx) async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      final file = File(xfile.path);
      if (file.existsSync()) {
        final Uint8List fileBytes = await file.readAsBytes();
        String? mimeType = lookupMimeType(file.path, headerBytes: fileBytes);
        if (mimeType != null) {
          if (mimeType.startsWith('image/') && mounted) {
            // TODO: Show Image Cropper
          }
        }
      }
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
            onTap: () => _pickImg(context),
            child: imgFile != null ? img : placeholder,
          ),
        ),
      ),
    );
  }
}
