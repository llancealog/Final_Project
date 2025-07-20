import 'package:flutter/material.dart';

/// Payments page for processing print job payments
/// Shows order summary, payment methods, and confirmation
class PaymentsPage extends StatefulWidget {
  final String printerName;
  final List<String> files;

  const PaymentsPage({
    super.key,
    required this.printerName,
    required this.files,
  });

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String selectedPaymentMethod = 'GCash'; // Default payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: const Color(0xFFDC143C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Section
            _buildOrderSummary(),
            const SizedBox(height: 24),

            // Payment Methods Section
            _buildPaymentMethods(),
            const SizedBox(height: 24),

            // Total and Pay Button
            _buildPaymentFooter(),
          ],
        ),
      ),
    );
  }

  /// Builds order summary card with printer and file details
  Widget _buildOrderSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Printer info
            Row(
              children: [
                const Icon(Icons.print, size: 16),
                const SizedBox(width: 8),
                Text(widget.printerName),
              ],
            ),
            const SizedBox(height: 8),

            // Files list
            const Text('Files:', style: TextStyle(fontWeight: FontWeight.w500)),
            ...widget.files.map(
              (file) => Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text('• $file'),
              ),
            ),
            const SizedBox(height: 12),

            // Cost breakdown
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Pages: 8'), Text('PHP 16.00')],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Service Fee:'), Text('PHP 1.00')],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'PHP 17.00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds payment method selection options
  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Payment options
        _buildPaymentOption('GCash', Icons.phone_android),
        _buildPaymentOption('PayMaya', Icons.credit_card),
        _buildPaymentOption('Cash', Icons.money),
      ],
    );
  }

  /// Builds individual payment method option
  Widget _buildPaymentOption(String method, IconData icon) {
    return Card(
      child: RadioListTile<String>(
        title: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(method),
          ],
        ),
        value: method,
        groupValue: selectedPaymentMethod,
        activeColor: Colors.blue, // Blue radio button when selected
        onChanged: (value) => setState(() => selectedPaymentMethod = value!),
      ),
    );
  }

  /// Builds total amount and pay button
  Widget _buildPaymentFooter() {
    return Column(
      children: [
        const SizedBox(height: 20),

        // Total amount display
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'PHP 17.00',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDC143C),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Pay button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _processPayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC143C),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Pay with $selectedPaymentMethod',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Handles payment processing (mock implementation)
  void _processPayment() {
    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Successful!'),
        content: Text(
          'Your print job has been sent to ${widget.printerName}.\n\nPayment Method: $selectedPaymentMethod\nAmount: PHP 17.00',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Return to main screen
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Done', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
