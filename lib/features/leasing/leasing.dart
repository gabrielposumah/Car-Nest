import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';

class GLeasingScreen extends StatelessWidget {
  const GLeasingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        title: Text('Leasing'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LeasingList(),
      ),
    );
  }
}

class LeasingList extends StatelessWidget {
  final List<Map<String, String>> leasingData = List.generate(
    5,
    (index) => {
      'title': 'Title $index',
      'subtitle': 'Subtitle $index',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      'logoUrl': 'assets/logos/Adira.png',
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leasingData.length,
      itemBuilder: (context, index) {
        final data = leasingData[index];
        return LeasingCard(
          title: data['title']!,
          subtitle: data['subtitle']!,
          description: data['description']!,
          logoUrl: data['logoUrl']!,
        );
      },
    );
  }
}

class LeasingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String logoUrl;

  LeasingCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  'A',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text('Adira'),
              subtitle: Text('Subhead'),
              trailing: Icon(Icons.more_vert),
            ),
            Image.asset(
              logoUrl,
              height: 100.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(subtitle),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
