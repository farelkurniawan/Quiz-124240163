// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: const Center(
//         child: Text('Ini akan jadi form login'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'list_page.dart'; // Import halaman tujuan

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controller untuk TextField email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // variabel untuk menandai apakah login gagal atau tidak
  bool _isLoginFailed = false; 

  // fungsi untuk menangani login
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // data dummy untuk login: email = "farel", password = "163"
    if (email == "farel" && password == "163") {
      setState(() {
        _isLoginFailed = false;
      });
      // Navigasi ke halaman ListPage dan mengganti halaman login agar tidak bisa kembali ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListPage()),
      );
    } else {
      setState(() {
        _isLoginFailed = true; // tandai login gagal agar menampilkan error di TextField
      });
      // Tampilkan notifikasi error di bawah layar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal: Email atau Password salah'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Culinarizz',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // TextField Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email (isi: farel)',
                  border: const OutlineInputBorder(),
                  errorText: _isLoginFailed ? 'Email/Password salah' : null, 
                ),
              ),
              const SizedBox(height: 16),
              
              // TextField Password
              TextField(
                controller: _passwordController,
                obscureText: true, // agar input password tidak terlihat
                decoration: InputDecoration(
                  hintText: 'Password (isi: 163)',
                  border: const OutlineInputBorder(),
                  errorText: _isLoginFailed ? 'Email/Password salah' : null,
                ),
              ),
              const SizedBox(height: 24),
              
              // Tombol Login
              ElevatedButton(
                onPressed: _login, // Panggil function saat diklik
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}