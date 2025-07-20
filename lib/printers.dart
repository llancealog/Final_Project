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
          rating: 4.5,
          totalJobs: 384,
          rate: '₱5/page',
          imageUrl: 'assets/logo.png',
        ),
        _buildPrinterCard(
          name: 'CS Lab Printer',
          location: 'Computer Science Building',
          rating: 4.3,
          totalJobs: 157,
          rate: '₱4/page',
          imageUrl: 'assets/logo.png',
        ),
        _buildPrinterCard(
          name: 'Engineering Printer',
          location: 'Engineering Building',
          rating: 4.0,
          totalJobs: 124,
          rate: '₱6/page',
          imageUrl: 'assets/logo.png',
        ),
        _buildPrinterCard(
          name: 'Student Center Printer',
          location: 'Student Center',
          rating: 4.5,
          totalJobs: 344,
          rate: '₱5/page',
          imageUrl: 'assets/logo.png',
        ),
      ],
    );
  }
  
  Widget _buildPrinterCard({
    required String name,
    required String location,
    required double rating,
    required int totalJobs,
    required String rate,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Printer image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Printer details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.bookmark_border),
                    ],
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              Text(
                                ' $rating',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Total Jobs
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Jobs',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '$totalJobs',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      // Rate
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rate',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            rate,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}