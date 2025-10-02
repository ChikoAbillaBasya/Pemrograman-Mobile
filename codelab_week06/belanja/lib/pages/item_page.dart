import 'package:flutter/material.dart';
import '/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: _getTeamColor(item.name),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Section
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _getTeamColor(item.name),
                    // ignore: deprecated_member_use
                    _getTeamColor(item.name).withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: 'item-${item.name}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            item.imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: _getTeamColor(item.name),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.sports_motorsports,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _getTeamName(item.name),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          // F1 Badge
                          Positioned(
                            top: 15,
                            right: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'FORMULA 1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (item.stock < 15)
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'LOW STOCK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${_formatPrice(item.price)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _getTeamColor(item.name),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Info Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          Icons.inventory,
                          'Stock',
                          '${item.stock} units',
                          item.stock > 15 ? Colors.green : Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoCard(
                          Icons.star,
                          'Rating',
                          '${item.rating}/5.0',
                          Colors.amber,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // F1 Specs
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _getTeamColor(
                        item.name,
                        // ignore: deprecated_member_use
                      ).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        // ignore: deprecated_member_use
                        color: _getTeamColor(item.name).withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.speed,
                              color: _getTeamColor(item.name),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'F1 Model Specifications',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _getTeamColor(item.name),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildSpecRow('Scale', '1:43'),
                        _buildSpecRow('Material', 'Die-cast Metal'),
                        _buildSpecRow('Team', _getTeamName(item.name)),
                        _buildSpecRow('Season', '2024'),
                        const SizedBox(height: 8),
                        Text(
                          _getF1Description(item.name),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: item.stock > 0
                          ? () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          '${item.name} added to cart!',
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }
                          : null, // Disable jika stock habis
                      style: ElevatedButton.styleFrom(
                        backgroundColor: item.stock > 0
                            ? _getTeamColor(item.name)
                            : Colors.grey,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: item.stock > 0 ? 2 : 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.stock > 0 ? Icons.shopping_cart : Icons.block,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.stock > 0 ? 'Add to Cart' : 'Out of Stock',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        // ignore: deprecated_member_use
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTeamColor(String itemName) {
    if (itemName.toLowerCase().contains('ferrari')) {
      return Colors.red[700]!;
    } else if (itemName.toLowerCase().contains('red bull')) {
      return Colors.blue[800]!;
    } else if (itemName.toLowerCase().contains('mercedes')) {
      return Colors.teal[400]!;
    } else if (itemName.toLowerCase().contains('mclaren')) {
      return Colors.orange[600]!;
    } else if (itemName.toLowerCase().contains('alpine')) {
      return Colors.blue[600]!;
    } else if (itemName.toLowerCase().contains('aston')) {
      return Colors.green[700]!;
    }
    return Colors.grey[600]!;
  }

  String _getTeamName(String itemName) {
    if (itemName.toLowerCase().contains('ferrari')) {
      return 'Scuderia Ferrari';
    } else if (itemName.toLowerCase().contains('red bull')) {
      return 'Red Bull Racing';
    } else if (itemName.toLowerCase().contains('mercedes')) {
      return 'Mercedes-AMG F1';
    } else if (itemName.toLowerCase().contains('mclaren')) {
      return 'McLaren F1 Team';
    } else if (itemName.toLowerCase().contains('alpine')) {
      return 'Alpine F1 Team';
    } else if (itemName.toLowerCase().contains('aston')) {
      return 'Aston Martin F1';
    }
    return 'Formula 1 Team';
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  String _getF1Description(String itemName) {
    if (itemName.toLowerCase().contains('ferrari')) {
      return 'Model mobil F1 Ferrari legendaris dengan livery merah ikonik. Replika sempurna dari mobil yang berlomba di kejuaraan motorsport paling bergengsi di dunia. Dilengkapi dengan detail autentik dan kualitas die-cast premium untuk para kolektor sejati.';
    } else if (itemName.toLowerCase().contains('red bull')) {
      return 'Model mobil F1 Red Bull Racing pemenang kejuaraan dengan detail autentik dan desain aerodinamis yang mendominasi sirkuit F1. Menampilkan livery biru khas Red Bull dengan teknologi hybrid power unit terdepan.';
    } else if (itemName.toLowerCase().contains('mercedes')) {
      return 'Model mobil F1 Mercedes-AMG dengan warisan silver arrows yang legendaris. Menampilkan teknologi hybrid power unit dan keunggulan engineering yang superior dalam Formula 1 racing. Kualitas premium untuk penggemar F1 sejati.';
    } else if (itemName.toLowerCase().contains('mclaren')) {
      return 'Model mobil F1 McLaren dengan livery papaya orange yang khas, mewakili kecepatan, inovasi, dan engineering Inggris terbaik dalam balap Formula 1. Detail sempurna untuk koleksi premium Anda.';
    } else if (itemName.toLowerCase().contains('alpine')) {
      return 'Model mobil F1 Alpine dengan livery biru khas yang menawan, mewakili keunggulan motorsport Prancis dan inovasi aerodinamis dalam Formula 1. Craftsmanship berkualitas tinggi dengan detail autentik.';
    } else if (itemName.toLowerCase().contains('aston')) {
      return 'Model mobil F1 Aston Martin dalam British racing green yang elegan, menggabungkan kemewahan otomotif dengan teknologi F1 terdepan. Representasi sempurna dari warisan balap Inggris yang bergengsi.';
    }
    return 'Model mobil Formula 1 autentik dengan detail craftsmanship yang sempurna dan livery tim resmi. Cocok untuk kolektor dan penggemar F1 sejati. Kualitas die-cast premium dengan akurasi tinggi.';
  }
}