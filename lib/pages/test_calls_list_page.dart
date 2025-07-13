import 'package:flutter/material.dart';

class TestCallsListPage extends StatelessWidget {
TestCallsListPage({super.key, required this.calls});
  final List<Map<String, dynamic>> calls;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls List'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Row 1: Title + Name
                  Text(
                    '${call["Title"]} ${call["FirstName"]} ${call["LastName"]}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  /// Row 2: Phone Number
                  Text(
                    'Phone: ${call["Phone"]}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),

                  /// Row 3: Duration + Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Duration: ${call["duration"]} mins',
                        style: TextStyle(fontSize: 15),
                      ),
                      Chip(
                        label: Text(call["status"]),
                        backgroundColor:
                            call["status"] == "called"
                                ? Colors.green[100]
                                : Colors.grey[200],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
