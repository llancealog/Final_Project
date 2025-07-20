import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String srCode;
  
  const HistoryPage({super.key, required this.srCode});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildHistoryCard(
          documentName: 'Assignment1.pdf',
          printerName: 'Library Printer 1',
          date: 'July 15, 2025',
          pages: 5,
          cost: 'PHP10.00',
          status: 'Completed',
        ),
        _buildHistoryCard(
          documentName: 'Research_Paper.docx',
          printerName: 'CS Lab Printer',
          date: 'July 10, 2025',
          pages: 12,
          cost: 'PHP15.00',
          status: 'Completed',
        ),
        _buildHistoryCard(
          documentName: 'Lecture_Notes.pdf',
          printerName: 'Engineering Printer',
          date: 'July 5, 2025',
          pages: 8,
          cost: 'PHP10.00',
          status: 'Completed',
        ),
        _buildHistoryCard(
          documentName: 'Group_Project.pptx',
          printerName: 'Student Center Printer',
          date: 'June 28, 2025',
          pages: 20,
          cost: 'PHP50.00',
          status: 'Completed',
        ),
      ],
    );
  }
  
  Widget _buildHistoryCard({
    required String documentName,
    required String printerName,
    required String date,
    required int pages,
    required String cost,
    required String status,
  }) {
    Color statusColor;
    IconData statusIcon;
    
    switch (status) {
      case 'Completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        statusIcon = Icons.pending;
        break;
      case 'Failed':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    documentName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, color: statusColor, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              printerName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoItem('Date', date),
                _buildInfoItem('Pages', pages.toString()),
                _buildInfoItem('Cost', cost),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}