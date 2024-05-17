import 'package:flutter/material.dart';

class GalleryIndex extends StatelessWidget {
  const GalleryIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery'),
      ),
      body: const Text('Gallery Index Page'),
    );
  }
}
