import 'package:flutter/material.dart';
import 'payments.dart';

/// Student profile page with academic and printing information
class ProfilePage extends StatefulWidget {
  final String srCode;

  const ProfilePage({super.key, required this.srCode});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Student Info Card
        _buildStudentInfoCard(),
        const SizedBox(height: 16),

        // Academic Info Card
        _buildAcademicInfoCard(),
        const SizedBox(height: 16),

        // Document Services Section
        const Text(
          'Document Services',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildDocumentCard('Student ID', Icons.badge),
        _buildDocumentCard('Copy of Grades', Icons.assignment),
        _buildDocumentCard(
          'Certificate of Registration',
          Icons.app_registration,
        ),
      ],
    );
  }

  /// Main student information card
  Widget _buildStudentInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Avatar
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Student Name
            const Text(
              'Juan Dela Cruz',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // SR Code
            Text(
              'SR-Code: ${widget.srCode}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  /// Academic information card
  Widget _buildAcademicInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Academic Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildInfoRow(Icons.school, 'Course', 'BS Information Technology'),
            _buildInfoRow(Icons.calendar_today, 'Year Level', '3rd Year'),
            _buildInfoRow(Icons.class_, 'Section', 'BSIT-3301'),
            _buildInfoRow(Icons.email, 'Email', '22-04875@g.batstate-u.edu.ph'),
          ],
        ),
      ),
    );
  }

  /// Individual info row with icon and text
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  /// Clickable document service card
  Widget _buildDocumentCard(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 24),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () => _handleDocumentTap(title),
      ),
    );
  }

  /// Handles document card tap events - shows popup and navigates to payments
  void _handleDocumentTap(String documentType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(documentType),
        content: Text(
          'You selected $documentType.\n\nReady to print your document!',
        ),
        actions: [
          ElevatedButton(
            onPressed: () => _navigateToPayments(documentType),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Print', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  /// Navigates to payments page with document info
  void _navigateToPayments(String documentType) {
    Navigator.pop(context); // Close dialog
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentsPage(
          printerName: 'Document Services',
          files: [documentType], // Pass selected document as file
        ),
      ),
    );
  }
}
