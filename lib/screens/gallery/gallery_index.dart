import 'package:flutter/material.dart';

class GalleryIndex extends StatelessWidget {
  const GalleryIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: const Center(
                  child: Text('Image Not Availabel'),
                ),
              );
            }),
      ),
    );
  }
}
