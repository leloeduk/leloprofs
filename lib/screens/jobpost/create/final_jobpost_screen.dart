import 'package:flutter/material.dart';
import '../../../models/post_model.dart';

class FinalJobPostScreen extends StatelessWidget {
  final JobPost jobPost;

  const FinalJobPostScreen({super.key, required this.jobPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Job Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Review your job post details below. If everything looks good, confirm your post.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Title:', jobPost.title),
            _buildDetailRow('Description:', jobPost.description),
            _buildDetailRow('Requirements:', jobPost.requirements),
            _buildDetailRow('Salary Range:', jobPost.salaryRange ?? "Aucun"),
            _buildDetailRow('Job Type:', jobPost.jobType ?? "Enseignant"),
            _buildDetailRow('Location:', jobPost.location ?? "Non Precisé"),
            _buildDetailRow(
                'Contact Person:', jobPost.contactPerson ?? "Pas fournie"),
            _buildDetailRow(
              'Benefits:',
              jobPost.benefits!.join(', '),
            ),
            _buildDetailRow(
              'Application Deadline:',
              jobPost.applicationDeadline != null
                  ? "${jobPost.applicationDeadline!.toLocal()}".split(' ')[0]
                  : 'Not specified',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to submit the job post
                  // e.g., upload to Firestore or API
                  // For demonstration, just pop the screen
                  Navigator.of(context).pop();
                },
                child: const Text('Confirm Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
