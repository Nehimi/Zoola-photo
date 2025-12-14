import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/booking/booking_details.dart';

class PhotographerProfileScreen extends StatelessWidget {
  const PhotographerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Zemenawi Photo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Works'),
              Tab(text: 'Services'),
              Tab(text: 'About'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildWorksTab(),
            _buildServicesTab(context),
            _buildAboutTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Handle add photo action
          },
          child: const Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  Widget _buildWorksTab() {
    // Replace with your actual images
    final List<String> images = List.generate(12, (index) => 'assets/images/work_${index + 1}.png');

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
            images[index],
            fit: BoxFit.cover,
             errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade800, child: const Icon(Icons.image, size: 40)),
            ),
        );
      },
    );
  }

  Widget _buildServicesTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ServiceTile(title: 'Wedding Photography', price: '5000'),
        ServiceTile(title: 'Portrait Photography', price: '2500'),
        ServiceTile(title: 'Event Photography', price: '4000'),
        ServiceTile(title: 'Graduation Photography', price: '3000'),
      ],
    );
  }

  Widget _buildAboutTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Zemenawi Photo',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'We are a team of passionate photographers dedicated to capturing your most precious moments. With over 10 years of experience, we specialize in weddings, portraits, and corporate events. Our mission is to provide you with stunning images that you will cherish for a lifetime.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 24),
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [Icon(Icons.phone, size: 18), SizedBox(width: 8), Text('+251 91 123 4567')],
          ),
          SizedBox(height: 8),
          Row(
            children: [Icon(Icons.email, size: 18), SizedBox(width: 8), Text('contact@zemenawiphoto.com')],
          ),
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final String price;

  const ServiceTile({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingDetailsScreen(serviceName: title, price: price)),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
              Text('$price ETB', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
