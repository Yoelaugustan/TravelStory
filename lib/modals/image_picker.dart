import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

// Image Picker Service
class ImagePickerService {
  static Future<File?> showImageSourceDialog(BuildContext context) async {
    File? selectedImage;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Color(0xFF4CB9E7)),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  selectedImage = await _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Color(0xFF4CB9E7)),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await _pickImageFromCamera();
                  if (context.mounted) {
                    Navigator.pop(context, image);
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
    return selectedImage;
  }

  static Future<File?> _pickImageFromGallery() async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }

  static Future<File?> _pickImageFromCamera() async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to take photo: $e');
    }
  }
}