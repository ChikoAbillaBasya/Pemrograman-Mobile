import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // === titleSection ===
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1 */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Formula 1 Grand Prix',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Monaco, Monte Carlo',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          /* soal 3 */
          const Icon(Icons.star, color: Colors.red),
          const Text('95'),
        ],
      ),
    );

    // === buttonSection ===
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.sports_motorsports, 'RACE'),
        _buildButtonColumn(color, Icons.schedule, 'SCHEDULE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // === textSection ===
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Formula 1 adalah ajang balap mobil paling bergengsi di dunia. '
        'Dengan teknologi canggih dan kecepatan tinggi hingga 300+ km/jam, '
        'F1 menghadirkan pertarungan sengit antara tim-tim terbaik dunia. '
        'Sirkuit Monaco adalah salah satu sirkuit paling ikonik dan menantang, '
        'dengan tikungan sempit di jalanan kota Monte Carlo. '
        'Setiap race weekend menghadirkan drama, overtaking spektakuler, dan strategi tim yang brilian. '
        '\n\nChiko Abilla Basya - 2341720005',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Chiko Abilla Basya (2341720005)',
      home: Scaffold(
        appBar: AppBar(title: const Text('Formula 1 App')),
        body: ListView(
          children: [
            Image.asset(
              'images/Monaco.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  // === Method Helper untuk button ===
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}