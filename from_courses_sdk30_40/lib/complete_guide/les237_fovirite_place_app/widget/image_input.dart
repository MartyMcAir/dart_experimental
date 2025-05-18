import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      onPressed: _takePicture,
    );

    if (_selectedImage != null) {
      // BoxFit.cover - automatic sizing of that image
      // to make sure that it'll always look good even if it must be resized
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    // Container because it will allow me to control size and also the alignment
    // final base = Theme.of(context).colorScheme.primary;
    // Color colorWithOpacity = Color.fromARGB(51, base.r.toInt(), base.g.toInt(), base.b.toInt());
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        // withValues or withAlpha insted withOpacity (deprecated)
        color: Theme.of(context).colorScheme.primary.withAlpha((255 * 0.2).round()),
      )),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
