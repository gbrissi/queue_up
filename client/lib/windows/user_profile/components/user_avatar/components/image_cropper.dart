import 'dart:io';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';

class ImageCropperDlg extends StatefulWidget {
  const ImageCropperDlg({super.key, required this.file}) : bytes = null;
  const ImageCropperDlg.fromBytes({super.key, required this.bytes})
    : file = null;

  final File? file;
  final Uint8List? bytes;

  @override
  State<ImageCropperDlg> createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropperDlg> {
  final _controller = CropController();
  Uint8List get imgBytes {
    if (widget.bytes != null) return widget.bytes!;
    return widget.file!.readAsBytesSync();
  }

  @override
  Widget build(BuildContext context) {
    return DialogContent(
      title: 'Image Cropper',
      subtitle: 'Crop your image in the desired way',
      children: [
        Crop(
          baseColor: Theme.of(context).colorScheme.surfaceContainer,
          controller: _controller,
          aspectRatio: 1,
          image: imgBytes,
          onCropped: (image) => Navigator.pop(context, image),
        ),
      ],
    );
  }
}
