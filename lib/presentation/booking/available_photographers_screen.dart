import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/booking/photographer_profile_screen.dart';

class AvailablePhotographersScreen extends StatelessWidget {
  const AvailablePhotographersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Photographers'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // I'll use placeholder data for now. You can replace this with real data from your backend.
          PhotographerCard(
            name: 'John Doe',
            specialty: 'Wedding Photographer',
            price: '150',
            imageUrl: 'assets/images/photographer_1.png', // Make sure to add this image
          ),
          SizedBox(height: 16),
          PhotographerCard(
            name: 'Jane Smith',
            specialty: 'Portrait Photographer',
            price: '100',
            imageUrl: 'assets/images/photographer_2.png', // Make sure to add this image
          ),
          SizedBox(height: 16),
          PhotographerCard(
            name: 'Zemenawi Photo',
            specialty: 'Events & Functions',
            price: '200',
            imageUrl: 'assets/images/photographer_3.png', // Make sure to add this image
          ),
        ],
      ),
    );
  }
}

class PhotographerCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String price;
  final String imageUrl;

  const PhotographerCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              // In case the image doesn't load, show a placeholder
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 80),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(specialty, style: TextStyle(color: Colors.grey.shade400)),
                const SizedBox(height: 8),
                Text('$price ETB / hr', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhotographerProfileScreen()),
              );
            },
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}
