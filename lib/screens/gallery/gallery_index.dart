import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GalleryIndex extends StatefulWidget {
  const GalleryIndex({super.key});

  @override
  State<GalleryIndex> createState() => _GalleryIndexState();
}

class _GalleryIndexState extends State<GalleryIndex> {
  List<File> galleries = [];
  bool loading = true;

  Future<String> get _localPath async =>
      (await getApplicationDocumentsDirectory()).path;

  Future<void> getGalleries() async {
    final path = await _localPath;

    setState(() {
      if (Directory('$path/my_gallery').existsSync()) {
        galleries = Directory('$path/my_gallery')
            .listSync()
            .map((file) => File(file.path))
            .toList();
      }
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getGalleries();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery'),
      ),
      body: loading
          ? const Center(child: Text('Loading...'))
          : galleries.isEmpty
              ? const Center(
                  child: Text('Gallery is empty'),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemCount: galleries.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.file(
                                width: double.infinity,
                                height: 135,
                                galleries[index],
                                fit: BoxFit.cover,
                              ),
                              TextButton(
                                  onPressed: () {
                                    galleries[index].deleteSync();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        'Success remove image from gallery...',
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                  },
                                  child: const Text('Remove Image'))
                            ],
                          ),
                        );
                      }),
                ),
    );
  }
}
