import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum Mobile',

      home: LoginPage(),

    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Setelah login berhasil, arahkan ke halaman dashboard
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage(email: email)),
      );
    } else {
      // Bisa menambahkan validasi jika diperlukan
      _showErrorDialog('Email atau password tidak boleh kosong');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialoga
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page', style: TextStyle(color: const Color.fromARGB(255, 3, 24, 44)), ),
        backgroundColor: const Color.fromARGB(255, 193, 80, 150).withOpacity(0.3),
        
      ),
        body: Stack(
            children: <Widget>[
              // Gambar sebagai background
              Container(
                decoration: BoxDecoration(
                 color: const Color.fromARGB(255, 65, 188, 222).withOpacity(0.5),
                ),
              ),
            // Container dengan form login
          Center(
            child:
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color:  Color.fromARGB(255, 3, 24, 44).withOpacity(0.8), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white.withOpacity(0.4),
                  
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 3, 24, 44))),
                      TextField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      TextField(
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),

              )
          )

        ]
      )

    );
  }
}


class DashboardPage extends StatelessWidget {
  final String email;

  // Constructor menerima email sebagai argumen
  DashboardPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: const Color.fromARGB(255, 3, 24, 44)),),
         backgroundColor: const Color.fromARGB(255, 193, 80, 150).withOpacity(0.3),
      ),
      body: Stack(
            children: <Widget>[
              // Gambar sebagai background
              Container(
                color: const Color.fromARGB(255, 65, 188, 222).withOpacity(0.5),
              ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Menampilkan Nama Kelompok
            Text(
              'Selamat Datang di Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,  color: const Color.fromARGB(255, 3, 24, 44),
              ),
              
            ),
            SizedBox(height: 20),
            Text(
              '\n Nama : Suryaningsih \n NIM    : 124220050 \n Kelas  : SI-B', // Ganti dengan nama kelompok
              style: TextStyle(fontSize: 20, color:  const Color.fromARGB(255, 3, 24, 44)),
            ),
            SizedBox(height: 100),

            // Tombol Menu
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman lain (menu) jika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
              child: Text('Menu'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
       ]
      )
    
    );
  }
}



class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';
  String _oddEvenResult = '';
  String _selectedOperation = '';

  void _performAddition() {
    final num1 = int.tryParse(_firstNumberController.text) ?? 0;
    final num2 = int.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = 'Hasil Penjumlahan: ${num1 + num2}';
    });
  }

  void _performSubtraction() {
    final num1 = int.tryParse(_firstNumberController.text) ?? 0;
    final num2 = int.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = 'Hasil Pengurangan: ${num1 - num2}';
    });
  }

  void _checkOddEven() {
    final num = int.tryParse(_firstNumberController.text) ?? 0;
    setState(() {
      _oddEvenResult = num % 2 == 0 ? 'Bilangan Genap' : 'Bilangan Ganjil';
    });
  }

  void _logout() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page', style: TextStyle(color: const Color.fromARGB(255, 3, 24, 44)),),
         backgroundColor: const Color.fromARGB(255, 193, 80, 150).withOpacity(0.3),
      ),
      body:  Stack(
            children: <Widget>[
              // Gambar sebagai background
              Container(
                color: const Color.fromARGB(255, 65, 188, 222).withOpacity(0.5),
              ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (_selectedOperation.isEmpty) ...[
              _buildMenuButton('Penjumlahan', () {
                setState(() {
                  _selectedOperation = 'addition';
                });
              }),
              _buildMenuButton('Pengurangan', () {
                setState(() {
                  _selectedOperation = 'subtraction';
                });
              }),
              _buildMenuButton('Cek Ganjil/Genap', () {
                setState(() {
                  _selectedOperation = 'oddEven';
                });
              }),
            ] else if (_selectedOperation == 'addition' || _selectedOperation == 'subtraction') ...[
              _buildInputField('Angka Pertama', _firstNumberController),
              _buildInputField('Angka Kedua', _secondNumberController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedOperation == 'addition' ? _performAddition : _performSubtraction,
                child: Text(_selectedOperation == 'addition' ? 'Hitung Penjumlahan' : 'Hitung Pengurangan', style: TextStyle(color:   Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 249, 158, 228).withOpacity(0.9),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(_result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ] else if (_selectedOperation == 'oddEven') ...[
              _buildInputField('Masukkan Angka', _firstNumberController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkOddEven,
                child: Text('Cek Ganjil/Genap', style: TextStyle(color:  Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 249, 158, 228).withOpacity(0.9),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(_oddEvenResult, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout', 
              style: TextStyle( color:  Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 24, 44),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Colors.white ),
              ),
            ),
          ],
        ),
      ),
            ]
      ),
    );
  }

  Widget _buildMenuButton(String title, VoidCallback onPressed) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
