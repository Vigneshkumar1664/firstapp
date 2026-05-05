import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Map<String, String>> categories = [
    {
      'title': 'Tablets',
      'image': 'assets/logo/tablets.jpg',
    },
    {
      'title': 'Syrup',
      'image': 'assets/logo/syrup.jpg',
    },
    {
      'title': 'Ointment',
      'image': 'assets/logo/ointment.jpg',
    },
    {
      'title': 'Facewash',
      'image': 'assets/logo/facewash.jpg',
    },
    {
      'title': 'Face Cream',
      'image': 'assets/logo/facecream.jpg',
    },
    {
      'title': 'Pain Spray',
      'image': 'assets/logo/painspray.jpg',
    },
    {
      'title': 'Roll-on Painkiller',
      'image': 'assets/logo/rollonpainkiller.jpg',
    },
    {
      'title': 'Protein Powder',
      'image': 'assets/logo/protein_powder.jpg',
    },
    {
      'title': 'Boost',
      'image': 'assets/logo/boost.jpg',
    },
    {
      'title': 'Horlicks',
      'image': 'assets/logo/horlicks.jpg',
    },
    {
      'title': 'Medicine Soaps',
      'image': 'assets/logo/medicine_soap.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        item['title']!,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
