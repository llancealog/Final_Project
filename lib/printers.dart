import 'package:flutter/material.dart';

class PrintersPage extends StatelessWidget {
  final String srCode;

  const PrintersPage({super.key, required this.srCode});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPrinterCard(
          name: 'Library Printer 1',
          location: 'Main Library Floor 1',
          status: 'Available',
          closingHours: 'Closes at 10:00 PM',
        ),
        _buildPrinterCard(
          name: 'CS Lab Printer',
          location: 'Computer Science Building',
          status: 'Busy',
          closingHours: 'Closes at 8:00 PM',
        ),
        _buildPrinterCard(
          name: 'Engineering Printer',
          location: 'Engineering Building',
          status: 'Available',
          closingHours: 'Closes at 9:00 PM',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer',
          location: 'Student Center',
          status: 'Offline',
          closingHours: 'Closes at 11:00 PM',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer 2',
          location: 'Student Center',
          status: 'Available',
          closingHours: 'Closes at 11:00 PM',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer 3',
          location: 'Student Center',
          status: 'Busy',
          closingHours: 'Closes at 11:00 PM',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer 4',
          location: 'Student Center',
          status: 'Available',
          closingHours: 'Closes at 11:00 PM',
        ),
      ],
    );
  }

  Widget _buildPrinterCard({
    required String name,
    required String location,
    required String status,
    required String closingHours,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Status and Hours row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getStatusIcon(status),
                            color: _getStatusColor(status),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            status,
                            style: TextStyle(
                              color: _getStatusColor(status),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Closing Hours
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hours',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      closingHours,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Available':
        return Colors.green;
      case 'Busy':
        return Colors.orange;
      case 'Offline':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Available':
        return Icons.check_circle;
      case 'Busy':
        return Icons.access_time;
      case 'Offline':
        return Icons.error;
      default:
        return Icons.help;
    }
  }
}
