import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('My Gallery App'),
              centerTitle: true,
              backgroundColor: Colors.lightGreen,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'My Gallery',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text('Add New Image'),
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text('Image Colelctions'),
                            icon: const Icon(Icons.image),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
