import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ryokou_service/themes/colors_theme.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  _UploadImageWidgetState createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImage> {
  final List<File> _imageFiles = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path)); // Thêm ảnh vào danh sách
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageFiles.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '(Đã thêm ${_imageFiles.length} ảnh)',
                    style: const TextStyle(color: AppColor.primaryColor),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _imageFiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.file(
                                    _imageFiles[index],
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () => _removeImage(index),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Text(
                'Vui lòng cung cấp thêm hình ảnh của Tour!',
                style: TextStyle(color: AppColor.primaryColor),
              ),
        const SizedBox(height: 20),
        SizedBox(
          width: 100,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                  color: AppColor.primaryColor,
                  width: 2,
                ))),
            onPressed: _pickImage,
            child: const Text(
              '+',
              style: TextStyle(fontSize: 40, color: AppColor.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
