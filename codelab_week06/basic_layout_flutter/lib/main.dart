import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout: Chiko Abilla Basya (2341720005)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formula 1 App'),
          backgroundColor: Colors.red[700],
          foregroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black12),
              child: Image.asset(
                'images/Monaco.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitleSection(),
            _buildButtonSection(context),
            _buildTextSection(),
            const Divider(thickness: 2),
            _buildGridGallery(),
            const Divider(thickness: 2),
            _buildTeamCards(),
            const Divider(thickness: 2),
            _buildStackDemo(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // === 1. Title Section ===
  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Formula 1 Grand Prix',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const Text(
                  'Monaco, Monte Carlo',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red, size: 28),
          const Text(
            '95',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // === 2. Button Section ===
  Widget _buildButtonSection(BuildContext context) {
    Color color = Colors.red[700]!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.sports_motorsports, 'RACE'),
          _buildButtonColumn(color, Icons.schedule, 'SCHEDULE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  // === 3. Text Section dengan Container styling ===
  Widget _buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: const Text(
        'Formula 1 adalah ajang balap mobil paling bergengsi di dunia. '
        'Dengan teknologi canggih dan kecepatan tinggi hingga 300+ km/jam, '
        'F1 menghadirkan pertarungan sengit antara tim-tim terbaik dunia. '
        'Sirkuit Monaco adalah salah satu sirkuit paling ikonik dan menantang. '
        '\n\nChiko Abilla Basya - 2341720005',
        softWrap: true,
        style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
      ),
    );
  }

  // === 4. Grid Gallery (GridView.extent) ===
  Widget _buildGridGallery() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'F1 Cars Gallery',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: GridView.extent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: List.generate(
                4,
                (i) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'images/cars${i + 1}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === 5. Team Cards (Improved Card + ListTile) ===
  Widget _buildTeamCards() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'F1 Teams',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.flash_on, color: Colors.blue),
              ),
              title: const Text(
                "Red Bull Racing",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Driver: Max Verstappen & Sergio Perez"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.star, color: Colors.teal),
              ),
              title: const Text(
                "Mercedes",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Driver: Lewis Hamilton & George Russell"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.speed, color: Colors.orange),
              ),
              title: const Text(
                "McLaren",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Driver: Lando Norris & Oscar Piastri"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.flag, color: Colors.red),
              ),
              title: const Text(
                "Ferrari",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Driver: Charles Leclerc & Carlos Sainz"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  // === 6. Stack Demo (Improved) ===
  Widget _buildStackDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Driver',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Center(
            child: Stack(
              alignment: const Alignment(0.6, 0.9),
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/driver.jpg'),
                    radius: 80,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: const Text(
                    'Lewis Hamilton',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}