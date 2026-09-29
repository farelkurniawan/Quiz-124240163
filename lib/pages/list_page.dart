// import 'package:flutter/material.dart';

// class LibraryPage extends StatelessWidget {
//   const LibraryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('List Page')),
//       body: const Center(child: Text('Daftar masakan akan muncul di sini')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/culinaryModels.dart';
import 'detail_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Masakan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: culinaryList.length,
        itemBuilder: (context, index) {
          final culinary = culinaryList[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            // InkWell
            child: InkWell(
              onTap: () {
                // Navigasi ke DetailPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(culinary: culinary),
                  ),
                );
              },
              child: Row(
                children: [
                  // Menampilkan Gambar Masakan
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.network(
                      culinary.imageUrl, 
                      width: 100, 
                      height: 140, 
                      fit: BoxFit.cover,
                      // errorBuilder untuk mengatasi HTTP error 404
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 140,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image, 
                            size: 50, 
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Menampilkan Nama, Kategori, dan Asal Daerah Masakan
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama
                          Text(
                            culinary.name,
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Kategori
                          Text(
                            culinary.category,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          // Asal Daerah
                          Text(
                            'Asal Daerah: ${culinary.origin}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
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