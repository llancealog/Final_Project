import 'package:flutter/material.dart';
import 'payments.dart';

class PrintersPage extends StatefulWidget {
  final String srCode;

  const PrintersPage({super.key, required this.srCode});

  @override
  State<PrintersPage> createState() => _PrintersPageState();
}

class _PrintersPageState extends State<PrintersPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPrinterCard(
          name: 'Library Printer',
          location: 'CEAFA Building 2nd Floor',
          status: 'Available',
          closingHours: 'Closes at 8:00 PM',
        ),
        _buildPrinterCard(
          name: 'CS Lab Printer',
          location: 'CICS Building 3rd Floor',
          status: 'Busy',
          closingHours: 'Closes at 6:00 PM',
        ),
        _buildPrinterCard(
          name: 'ACES Printer',
          location: 'ACES Building 3rd FLoor',
          status: 'Available',
          closingHours: 'Closes at 7:00 PM',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer',
          location: 'Student Center',
          status: 'Offline',
          closingHours: 'Closes at 8:00 PM',
        ),
        _buildPrinterCard(
          name: 'CICS Printer',
          location: 'CICS Building 2nd Floor',
          status: 'Available',
          closingHours: 'Closes at 7:00 PM',
        ),
        _buildPrinterCard(
          name: 'CET Printer',
          location: 'CET Building 4th Floor',
          status: 'Busy',
          closingHours: 'Closes at 8:00 PM',
        ),
        _buildPrinterCard(
          name: 'CEAFA Printer',
          location: 'CEAFA Building 1st Floor',
          status: 'Available',
          closingHours: 'Closes at 8:00 PM',
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
    return GestureDetector(
      // Make the entire card clickable
      onTap: () => _handlePrinterTap(name, status),
      child: Card(
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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

  // ========== CLICKABLE FUNCTIONALITY ==========

  /// Handles printer card tap events
  /// Only shows popup for Available and Busy printers
  /// Offline printers are ignored (no interaction)
  void _handlePrinterTap(String printerName, String status) {
    if (status == 'Available' || status == 'Busy') {
      _showSimplePopup(printerName, status);
    }
  }

  /// Shows upload files dialog with file selection and upload functionality
  /// Matches the design mockup with upload area and file list
  void _showSimplePopup(String printerName, String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.upload_file, size: 24),
                        const SizedBox(width: 8),
                        const Text(
                          'Upload Files',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Upload area with border and choose files button
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.folder_open,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {}, // No logic needed - just UI
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                        ),
                        child: const Text(
                          'Choose Files',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // File restrictions text
                const Text(
                  'Max file size of 10mb.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Uploaded files section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Uploaded Files',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 12),

                // Mock uploaded files
                _buildFileItem('COR.pdf', Icons.description),
                _buildFileItem('Student-ID.png', Icons.image),
                const SizedBox(height: 20),

                // Upload & Pay button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _navigateToPayments(printerName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Upload & Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds individual file items in the uploaded files list
  Widget _buildFileItem(String fileName, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(child: Text(fileName, style: const TextStyle(fontSize: 14))),
          IconButton(
            onPressed: () {}, // Mock delete functionality
            icon: const Icon(Icons.close, size: 16),
          ),
        ],
      ),
    );
  }

  /// Navigates to payments page with printer and file info
  void _navigateToPayments(String printerName) {
    Navigator.pop(context); // Close upload dialog
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentsPage(
          printerName: printerName,
          files: const ['COR.pdf', 'Student-ID.png'], // Mock files
        ),
      ),
    );
  }
}
