import 'package:flutter/material.dart';

class GalleryCreate extends StatefulWidget {
  const GalleryCreate({super.key});

  @override
  State<GalleryCreate> createState() => _GalleryCreateState();
}

class _GalleryCreateState extends State<GalleryCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new image'),
      ),
      body: const Text('Add new gallery page'),
    );
  }
}
