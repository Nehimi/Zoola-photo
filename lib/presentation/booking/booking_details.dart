import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/booking/booking_confirmation_screen.dart';

class BookingDetailsScreen extends StatefulWidget {
  final String serviceName;
  final String price;

  const BookingDetailsScreen({
    super.key,
    required this.serviceName,
    required this.price,
  });

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  String _selectedPaymentMethod = 'telebirr'; // Default payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Booking Details Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 28),
                        SizedBox(width: 12),
                        Text('Zemenawi Photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(Icons.camera_roll, 'Service', widget.serviceName),
                    const SizedBox(height: 12),
                    // TODO: In a real app, this should be a selectable date
                    _buildDetailRow(Icons.calendar_today, 'Date', 'October 10, 2016 (E.C.)'),
                    const SizedBox(height: 12),
                    // TODO: In a real app, this should be a selectable time
                    _buildDetailRow(Icons.access_time, 'Time', '4:00 PM - 5:00 PM'),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Total Price
            Center(
              child: Text(
                'Total: ${widget.price} ETB',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(height: 32),

            // Payment Method Selection
            const Text('Select Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption(
                  context,
                  'telebirr',
                  'assets/images/telebirr_logo.png', // User needs to add this image
                ),
                _buildPaymentOption(
                  context,
                  'CBE Birr',
                  'assets/images/cbe_birr_logo.png', // User needs to add this image
                ),
              ],
            ),
            const Spacer(),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // In a real app, you would process the payment here.
                // For now, we will just navigate to the confirmation screen.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BookingConfirmationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Confirm & Pay', style: TextStyle(fontSize: 18)),
            ),
             const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade400),
        const SizedBox(width: 16),
        Text('$title: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildPaymentOption(BuildContext context, String methodName, String imagePath) {
    final bool isSelected = _selectedPaymentMethod == methodName;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = methodName;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            // In case the image doesn't load
             errorBuilder: (context, error, stackTrace) => Center(child: Text(methodName, textAlign: TextAlign.center)),
          ),
        ),
      ),
    );
  }
}
