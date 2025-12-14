import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/home/home_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        automaticallyImplyLeading: false, // No back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 24),
            const Text(
              'Booking Confirmed!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            // This would display the actual booking details.
            // For now, I'm using placeholder text.
            _buildConfirmationDetails(context),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen, clearing the navigation stack
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Back to Home'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // TODO: Navigate to a screen showing all user bookings
              },
              child: const Text('View My Bookings'),
            ),
             const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationDetails(BuildContext context) {
    // In a real app, you would pass the actual booking data to this screen.
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Booking Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildDetailRow(context, 'Service', 'Portrait Photography'),
          const SizedBox(height: 8),
          _buildDetailRow(context, 'Date', 'October 10, 2016 (E.C.)'),
          const SizedBox(height: 8),
          _buildDetailRow(context, 'Time', '4:00 PM - 5:00 PM'),
           const SizedBox(height: 8),
          _buildDetailRow(context, 'Price', '2,500 ETB'),
           const SizedBox(height: 8),
          _buildDetailRow(context, 'Payment Method', 'telebirr'),
        ],
      ),
    ));
  }

  Widget _buildDetailRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: Colors.grey.shade400)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
