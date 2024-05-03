import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            // Search and filter icons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search all',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 15), // centers the placeholder
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Section title with view all
            _buildSectionTitle('Analytics', 'View all'),
            const SizedBox(height: 20),
            _buildAnalyticsItem(Icons.queue, 'Request Queue', Colors.teal[400]!),
            _buildAnalyticsItem(Icons.how_to_vote, 'In Approval', Colors.blue[400]!),
            _buildAnalyticsItem(Icons.border_color, 'In Signature', Colors.orange[400]!),
            _buildAnalyticsItem(Icons.edit, 'In Draft', Colors.pink[400]!),
            const SizedBox(height: 20),
            _buildSectionTitle('Pending Approval', 'View all'),
            Wrap(
              spacing: 10,
              children: [
                _buildNameTag('SHIVA', Colors.orange),
                _buildNameTag('ELLE', Colors.orange),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Recent Contracts', 'View all'),
            Wrap(
              spacing: 10,
              children: [
                _buildNameTag('ARJO', Colors.green),
                _buildNameTag('MARIE', Colors.green),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(action, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildAnalyticsItem(IconData icon, String title, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color, radius: 20, child: Icon(icon, color: Colors.white, size: 20)),
          SizedBox(width: 10),
          Expanded(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildNameTag(String name, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(name, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
