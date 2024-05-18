import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class GalleryCreate extends StatefulWidget {
  const GalleryCreate({super.key});

  @override
  State<GalleryCreate> createState() => _GalleryCreateState();
}

class _GalleryCreateState extends State<GalleryCreate> {
  File? _image;
  final TextEditingController _filename = TextEditingController();
  String _extension = '';

  final picker = ImagePicker();

  Future<String> get _localPath async =>
      (await getApplicationDocumentsDirectory()).path;

  Future getImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _filename.text = basenameWithoutExtension((_image!.path));
        _extension = extension((_image!.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 200,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: _image != null
                      ? Image.file(
                          _image!.absolute,
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Icon(Icons.add_photo_alternate_outlined),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _filename,
                decoration: const InputDecoration(
                    labelText: 'Filename', border: OutlineInputBorder()),
                onChanged: (String value) {
                  setState(() {
                    _filename.text = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Choose an image...',
                        ),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }

                    final path = await _localPath;
                    await Directory('$path/my_gallery').create();
                    _image!
                        .copy('$path/my_gallery/${_filename.text}$_extension');

                    setState(() {
                      _image = null;
                      _filename.text = '';
                      _extension = '';
                    });

                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Success add image to gallery...',
                      ),
                      backgroundColor: Colors.green,
                      action: SnackBarAction(
                          label: 'Go to gallery',
                          onPressed: () {
                            Navigator.pushNamed(context, '/galleries');
                          }),
                    ));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add to Gallery'))
            ],
          ),
        ),
      ),
    );
  }
}
