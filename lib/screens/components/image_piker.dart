import 'dart:io' as io;
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  dynamic _image; // Can be File for mobile or String for web
  final TextEditingController _imageController = TextEditingController();

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // Web platform
      final uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files!.isEmpty) return;

        final reader = html.FileReader();
        reader.readAsDataUrl(files[0]);
        reader.onLoadEnd.listen((e) {
          setState(() {
            _image = reader.result as String;
            _imageController.text = _image;
          });
        });
      });
    } else {
      // Mobile platform
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = io.File(pickedFile.path);
          _imageController.text = pickedFile.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _image != null
            ? kIsWeb
                ? Image.network(_image,
                    height: 150, width: 150, fit: BoxFit.cover)
                : Image.file(_image, height: 150, width: 150, fit: BoxFit.cover)
            : const Placeholder(fallbackHeight: 150, fallbackWidth: 150),
        const SizedBox(height: 16.0),
        TextButton(
          onPressed: _pickImage,
          child: const Text('Choisir une image'),
        ),
        TextFormField(
          controller: _imageController,
          decoration: const InputDecoration(
            labelText: 'URL de l\'image ou chemin',
          ),
          enabled: false,
        ),
      ],
    );
  }
}
