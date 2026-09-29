// import 'package:flutter/material.dart';
// import '../models/culinaryModels.dart'; // Import modelnya

// class DetailPage extends StatelessWidget {
//   // Menyiapkan variabel penampung data yang dikirim
//   final Culinary culinary;

//   // Constructor wajib (required) menerima data culinary[cite: 4]
//   const DetailPage({super.key, required this.culinary});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(culinary.name), // Menampilkan nama dari data yang dikirim
//       ),
//       body: Center(
//         child: Text('Detail dari masakan ${culinary.name} akan muncul di sini'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/culinaryModels.dart';

class DetailPage extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim dari ListPage
  final Culinary culinary;

  // Constructor wajib (required) menerima data culinary
  const DetailPage({super.key, required this.culinary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Masakan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Image.network(
              culinary.imageUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
              // errorBuilder untuk mengatasi HTTP error 404
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                );
              },
            ),
            
            // Informasi Masakan 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  Text(
                    culinary.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  
                  // Kategori
                  Text(
                    '${culinary.category}',
                    style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),

                  // Asal Daerah
                  Text(
                    'Asal Daerah: ${culinary.origin}',
                    style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                  
                  // // Row untuk menampilkan beberapa info berjajar ke samping[cite: 2]
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buildInfoBox('Tahun', culinary.flavor.toString()),
                  //     _buildInfoBox('Halaman', '${culinary.spicyLevel} Hal'),
                  //     _buildInfoBox('Rating', '⭐ ${culinary.servingTime}'),
                  //   ],
                  // ),
                  // const SizedBox(height: 16),
                  
                  // Garis pembatas
                  const Divider(height: 32, thickness: 1),
                  
                  // Bahan Utama
                  const Text(
                    'Bahan Utama:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    culinary.mainIngredient,
                    style: const TextStyle(fontSize: 14, height: 1.5), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Rasa 
                  const Text(
                    'Rasa:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    culinary.flavor,
                    style: const TextStyle(fontSize: 14, height: 1.5), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Level Pedas
                  const Text(
                    'Level Pedas:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    culinary.spicyLevel,
                    style: const TextStyle(fontSize: 14, height: 1.5), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Waktu Penyajian
                  const Text(
                    'Waktu Penyajian:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    culinary.servingTime,
                    style: const TextStyle(fontSize: 14, height: 1.5), // height untuk merenggangkan jarak antar baris teks
                  ),

                  // Garis pembatas
                  const Divider(height: 32, thickness: 1),
                  
                  // Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    culinary.description,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//   // Fungsi bantuan (helper function) untuk membuat kotak info (Tahun, Halaman, Rating)
//   // Ini dilakukan agar kita tidak perlu menulis ulang kode Column yang sama berkali-kali[cite: 2]
//   Widget _buildInfoBox(String label, String value) {
//     return Column(
//       children: [
//         Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
//         const SizedBox(height: 4),
//         Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//       ],
//     );
//   }

}